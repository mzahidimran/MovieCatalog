//
//  MovieRepository.swift
//  Test
//
//  Created by Muhammad Zahid Imran on 4/22/19.
//  Copyright © 2019 24. All rights reserved.
//

import Foundation
import ObjectMapper
/**
 
Remote movie repository subclassed from RemoteRepository confirms **MovieRepositoryProtocol**
 
*/


class RemoteMovieRepository: RemoteRepository {
    
}

extension RemoteMovieRepository : MovieRepositoryProtocol {
    
    func getPopular<T>(page: Int, completion: @escaping (_ response: Pageable<T>?, _ error: Error?) -> Void) -> Void where T: MovieModelProtocol, T: Mappable
    {
        let query:[String : Any] = ["api_key" : AppConstants.shared.MOVIE_DB_API_KEY, "page":page]
        self.request(requestConverter: Router.popular.get(params: "", query: query), completion: completion)
    }
    
    func getMovie<T>(id: Int, completion: @escaping (_ response: T?, _ error: Error?) -> Void) -> Void  where T: MovieModelProtocol, T: Mappable
    {
        let query:[String : Any] = ["api_key" : AppConstants.shared.MOVIE_DB_API_KEY]
        self.request(requestConverter: Router.movie.get(params: "\(id)", query: query), completion: completion)
    }
    
    func getVideos(id: Int, completion: @escaping (VideoResponse?, Error?) -> Void) -> Void {
        let query:[String : Any] = ["api_key" : AppConstants.shared.MOVIE_DB_API_KEY]
        self.request(requestConverter: Router.movie("\(id)").getVideos(params: "", query: query), completion: completion)
    }
    
}
