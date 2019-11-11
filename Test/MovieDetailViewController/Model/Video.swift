//
//  Video.swift
//  Test
//
//  Created by Muhammad Zahid Imran on 4/23/19.
//  Copyright © 2019 24. All rights reserved.
//

import Foundation
import ObjectMapper


//MARK: Video Model Protocol

protocol VideoModelProtocol {
    var id: String { get set }
    var iso_639_1: String { get set }
    var iso_3166_1: String { get set }
    var key: String { get set }
    var name: String { get set }
    var site: String { get set }
    var size: Video.Quality { get set }
    var type: Video.VideoType { get set }
}

/**
 
Video model confirms to Mappable and VideoModelProtocol

*/

struct Video: Mappable, VideoModelProtocol {
    
    //MARK:Quality
    
    /**
    Movie quality enum
     
     - low_360p for 360p
     - sd_480p for 480p
     - hd_720p for 720p
     - hd_1080p for 1080p

    */
    
    enum Quality: Int {
        case low_360p = 360
        case sd_480p = 480
        case hd_720p = 720
        case hd_1080p = 1080
    }
    
    
    //MARK:VideoType
    
    /**
    Video type enum
     
     - Trailer
     - Teaser
     - Clip
     - Featurette
     - Behind_the_Scenes for  "Behind the Scenes"
     - Bloopers

    */
    
    enum VideoType: String {
        case Trailer, Teaser, Clip, Featurette, Behind_the_Scenes = "Behind the Scenes", Bloopers
    }
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        iso_639_1 <- map["iso_639_1"]
        id <- map["id"]
        iso_3166_1 <- map["iso_3166_1"]
        key <- map["key"]
        name <- map["name"]
        site <- map["site"]
        size <- (map["size"], EnumTransform<Video.Quality>())
        type <- (map["type"], EnumTransform<Video.VideoType>())
    }
    
    var id: String = ""
    var iso_639_1: String = ""
    var iso_3166_1: String = ""
    var key: String = ""
    var name: String = ""
    var site: String = ""
    var size: Quality = .low_360p
    var type: VideoType = .Trailer
}
