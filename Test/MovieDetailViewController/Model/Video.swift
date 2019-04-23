//
//  Video.swift
//  Test
//
//  Created by Muhammad Zahid Imran on 4/23/19.
//  Copyright © 2019 24. All rights reserved.
//

import Foundation
import ObjectMapper

enum Quality: Int {
    case low_360p = 360
    case sd_480p = 480
    case hd_720p = 720
    case hd_1080p = 1080
}

enum Type: String {
    case Trailer, Teaser, Clip, Featurette, Behind_the_Scenes = "Behind the Scenes", Bloopers
}

struct Video: Mappable {
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        iso_639_1 <- map["iso_639_1"]
        id <- map["id"]
        iso_3166_1 <- map["iso_3166_1"]
        key <- map["key"]
        name <- map["name"]
        site <- map["site"]
        size <- (map["size"], EnumTransform<Quality>())
        type <- (map["type"], EnumTransform<Type>())
    }
    
    var id: String = ""
    var iso_639_1: String = ""
    var iso_3166_1: String = ""
    var key: String = ""
    var name: String = ""
    var site: String = ""
    var size: Quality = .low_360p
    var type: Type = .Trailer
}
