//
//  MovieRepository.swift
//  Test
//
//  Created by Muhammad Zahid Imran on 4/22/19.
//  Copyright © 2019 24. All rights reserved.
//

import Foundation


class MovieRepository: Repository {
    
    func getPopular(page: Int, completion: @escaping (Pageable<Movie>?, Error?) -> Void) -> NetworkRequest {
        let query:[String : Any] = ["api_key" : Resolver.constants.MOVIE_DB_API_KEY, "page":page]
        return self.request(requestConverter: Router.popular.get(params: "", query: query), completion: completion)
    }
    
    func getMovie(id: Int, completion: @escaping (MovieDetail?, Error?) -> Void) -> NetworkRequest {
        let query:[String : Any] = ["api_key" : Resolver.constants.MOVIE_DB_API_KEY]
        return self.request(requestConverter: Router.movie.get(params: "\(id)", query: query), completion: completion)
    }
    
    func getVideos(id: Int, completion: @escaping (VideoResponse?, Error?) -> Void) -> NetworkRequest {
        let query:[String : Any] = ["api_key" : Resolver.constants.MOVIE_DB_API_KEY]
        return self.request(requestConverter: Router.movie("\(id)").getVideos(params: "", query: query), completion: completion)
    }

}
