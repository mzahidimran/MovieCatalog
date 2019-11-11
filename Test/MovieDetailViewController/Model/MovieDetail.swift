//
//  MovieDetail.swift
//  Test
//
//  Created by Muhammad Zahid Imran on 4/22/19.
//  Copyright © 2019 24. All rights reserved.
//

import Foundation
import ObjectMapper

/**
 
Video detail model confirms to Mappable

*/
struct MovieDetail: Mappable {
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        vote_count <- map["vote_count"]
        id <- map["id"]
        video <- map["video"]
        vote_average <- map["vote_average"]
        title <- map["title"]
        popularity <- map["popularity"]
        poster_path <- map["poster_path"]
        original_language <- map["original_language"]
        original_title <- map["original_title"]
        genres <- map["genres"]
        backdrop_path <- map["backdrop_path"]
        adult <- map["adult"]
        overview <- map["overview"]
        release_date <- (map["release_date"], DateFormatterTransform(dateFormatter: DateFormatter(withFormat: "yyyy-MM-dd", locale: "en_US")))
    }
    
    var vote_count: Int = 0
    var id:Int = 0
    var video:Bool = false
    var vote_average: Float = 0.0
    var title: String = ""
    var popularity: Double = 0.0
    var poster_path: String = ""
    var original_language: String = ""
    var original_title: String = ""
    var genres: [Genre] = []
    var backdrop_path: String = ""
    var adult: Bool = false
    var overview: String = ""
    var release_date: Date = Date()
}



/**
 
Movie genre model confirms to Mappable

*/
struct Genre: Mappable {
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }
    
    var id: Int  = 0
    var name: String = ""
    
    
}
