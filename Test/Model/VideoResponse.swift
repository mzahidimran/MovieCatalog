//
//  VideoResponse.swift
//  Test
//
//  Created by Muhammad Zahid Imran on 4/23/19.
//  Copyright © 2019 24. All rights reserved.
//

import Foundation
import ObjectMapper

struct VideoResponse: Mappable {
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        results <- map["results"]
    }
    
    var id: Int = 0
    var results: [Video] = []
    
}
