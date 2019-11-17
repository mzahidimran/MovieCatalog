//
//  MovieVMTests.swift
//  TestTests
//
//  Created by Muhammad Zahid Imran on 11/17/19.
//  Copyright © 2019 24. All rights reserved.
//

import Foundation
import XCTest
@testable import Test
import Observable

class MovieVMTests: XCTestCase {
    
    func testDefaultCases() -> Void {
        let movieCatalogVM:MovieVMProtocol = MovieVM(repository:MockMovieRepository())
        XCTAssertFalse(movieCatalogVM.networkActivity.value)
        XCTAssertEqual(movieCatalogVM.overview.value, "")
        XCTAssertEqual(movieCatalogVM.title.value, "")
        let dateformatter = DateFormatter(withFormat: "dd.MM.yyyy", locale: "en_US")
        XCTAssertEqual(movieCatalogVM.releaseDate.value, dateformatter.string(from: Date()))
        XCTAssertEqual(movieCatalogVM.genre.value, "")
        XCTAssertEqual(movieCatalogVM.videos.value.count, 0)
        XCTAssertNil(movieCatalogVM.bannerURl.value)
        XCTAssertNil(movieCatalogVM.error.value)

    }
    
    func testMovieDetailLoadCase() -> Void {
        let movieCatalogVM:MovieVMProtocol = MovieVM(repository:MockMovieRepository())
        movieCatalogVM.load(movieID: 920)
        XCTAssertEqual(movieCatalogVM.title.value, "Cars")
        XCTAssertEqual(movieCatalogVM.overview.value, "Lightning McQueen, a hotshot rookie race car driven to succeed, discovers that life is about the journey, not the finish line, when he finds himself unexpectedly detoured in the sleepy Route 66 town of Radiator Springs. On route across the country to the big Piston Cup Championship in California to compete against two seasoned pros, McQueen gets to know the town's offbeat characters.")
        XCTAssertEqual(movieCatalogVM.releaseDate.value, "08.06.2006")
        XCTAssertEqual(movieCatalogVM.genre.value, "Animation, Adventure, Comedy, Family")
        XCTAssertEqual(movieCatalogVM.bannerURl.value?.absoluteString, "https://image.tmdb.org/t/p/w342/a1MlbLBk5Sy6YvMbSuKfwGlDVlb.jpg")
        XCTAssertNil(movieCatalogVM.error.value)
    }
    
    func testLoadVideos() -> Void {
        let movieCatalogVM:MovieVMProtocol = MovieVM(repository:MockMovieRepository())
        movieCatalogVM.loadVideos(movieID: 920)
        XCTAssertEqual(movieCatalogVM.videos.value.count, 1)
        XCTAssertEqual(movieCatalogVM.videos.value.first?.type, Video.VideoType.Trailer)
        XCTAssertEqual(movieCatalogVM.videos.value.first?.size, Video.Quality.low_360p)
        XCTAssertEqual(movieCatalogVM.videos.value.first?.name, "Official Trailer: Cars (2006)")
    }
    
    func testFailedLoadPopularCase() -> Void {
        let movieCatalogVM:MovieVMProtocol = MovieVM(repository:MockMovieRepository())
        movieCatalogVM.load(movieID: 900)
        XCTAssertFalse(movieCatalogVM.networkActivity.value)
        XCTAssertEqual(movieCatalogVM.overview.value, "")
        XCTAssertEqual(movieCatalogVM.title.value, "")
        let dateformatter = DateFormatter(withFormat: "dd.MM.yyyy", locale: "en_US")
        XCTAssertEqual(movieCatalogVM.releaseDate.value, dateformatter.string(from: Date()))
        XCTAssertEqual(movieCatalogVM.genre.value, "")
        XCTAssertNil(movieCatalogVM.bannerURl.value)
        XCTAssertNotNil(movieCatalogVM.error.value)
        XCTAssertEqual(movieCatalogVM.error.value?.localizedDescription, "Unable to process request")
    }
    
}
