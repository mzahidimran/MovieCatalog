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
        XCTAssertNil(movieCatalogVM.bannerURl.value)
        XCTAssertNil(movieCatalogVM.error.value)

    }
    
}
