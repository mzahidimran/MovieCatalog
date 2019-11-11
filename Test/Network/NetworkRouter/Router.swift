//
//  Router.swift
//  Test
//
//  Created by Muhammad Zahid Imran on 4/22/19.
//  Copyright © 2019 24. All rights reserved.
//

import Foundation

struct Router: URLRouter {
    static var basePath: String {
        return AppConstants.shared.BASE_URL
    }
    
    struct popular: Readable {
        var urlParams: String!
        var route: String = "movie/popular"
    }
    
    struct movie: Readable {
        var urlParams: String!
        var route: String = "movie"
    }
    
    struct videos: Readable {
        var urlParams: String!
        var route: String = "videos"
    }
    
}

extension Router.movie {
    func getVideos(params: String, query: Parameters = [:]) -> RequestConverter {
        return nestedRoute(args: urlParams, child: Router.videos.get(params: params, query: query, httpHeaders: nil))
    }
}
