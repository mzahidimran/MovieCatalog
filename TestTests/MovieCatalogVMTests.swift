//
//  MovieCatalogVMTests.swift
//  TestTests
//
//  Created by Muhammad Zahid Imran on 11/13/19.
//  Copyright © 2019 24. All rights reserved.
//

import Foundation
import XCTest
@testable import Test
import Observable

class MovieCatalogVMTests: XCTestCase {
    
    
    func testDefaultCases() -> Void {
        let movieCatalogVM:MovieCatalogVMProtocol = MovieCatalogVM(repository:MockMovieRepository())
        XCTAssertFalse(movieCatalogVM.isSearching)
        XCTAssertFalse(movieCatalogVM.networkActivity.value)
        XCTAssertEqual(movieCatalogVM.filter, "")
        XCTAssertFalse(movieCatalogVM.isNextPageAvailable)
        XCTAssertNil(movieCatalogVM.error.value)
        XCTAssertEqual(movieCatalogVM.moviesCount, 0)
    }
    
    func testLoadPopularCase() -> Void {
        let movieCatalogVM:MovieCatalogVMProtocol = MovieCatalogVM(repository:MockMovieRepository())
        movieCatalogVM.load(page: 1)
        XCTAssertFalse(movieCatalogVM.isSearching)
        XCTAssertFalse(movieCatalogVM.networkActivity.value)
        XCTAssertEqual(movieCatalogVM.filter, "")
        XCTAssertTrue(movieCatalogVM.isNextPageAvailable)
        XCTAssertNil(movieCatalogVM.error.value)
        XCTAssertEqual(movieCatalogVM.moviesCount, 20)
        movieCatalogVM.loadNextPage()
        XCTAssertFalse(movieCatalogVM.isSearching)
        XCTAssertFalse(movieCatalogVM.networkActivity.value)
        XCTAssertEqual(movieCatalogVM.filter, "")
        XCTAssertTrue(movieCatalogVM.isNextPageAvailable)
        XCTAssertNil(movieCatalogVM.error.value)
        XCTAssertEqual(movieCatalogVM.moviesCount, 40)
    }
    
    
    func testFilterCase() -> Void {
        var movieCatalogVM:MovieCatalogVMProtocol = MovieCatalogVM(repository:MockMovieRepository())
        movieCatalogVM.filter = "Joker"
        XCTAssertTrue(movieCatalogVM.isSearching)
        XCTAssertFalse(movieCatalogVM.networkActivity.value)
        XCTAssertEqual(movieCatalogVM.filter, "Joker")
        XCTAssertFalse(movieCatalogVM.isNextPageAvailable)
        XCTAssertNil(movieCatalogVM.error.value)
        XCTAssertEqual(movieCatalogVM.moviesCount, 0)
    }
    
    func testFailedLoadPopularCase() -> Void {
        let movieCatalogVM:MovieCatalogVMProtocol = MovieCatalogVM(repository:MockMovieRepository())
        movieCatalogVM.load(page: 0)
        XCTAssertFalse(movieCatalogVM.isSearching)
        XCTAssertFalse(movieCatalogVM.networkActivity.value)
        XCTAssertEqual(movieCatalogVM.filter, "")
        XCTAssertFalse(movieCatalogVM.isNextPageAvailable)
        XCTAssertNotNil(movieCatalogVM.error.value)
        XCTAssertEqual(movieCatalogVM.error.value?.localizedDescription, "Unable to process request")
        XCTAssertEqual(movieCatalogVM.moviesCount, 0)
    }
    
}
