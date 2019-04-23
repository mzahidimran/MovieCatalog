//
//  Pageable.swift
//  Test
//
//  Created by Muhammad Zahid Imran on 4/21/19.
//  Copyright © 2019 24. All rights reserved.
//

import Foundation
import ObjectMapper

struct Pageable<T: Mappable>: Mappable {
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        page <- map["page"]
        total_results <- map["total_results"]
        total_pages <- map["total_pages"]
        results <- map["results"]
    }
    
    var page: Int = 0
    var total_results: Int = 0
    var total_pages: Int = 0
    var results: [T] = []
}
