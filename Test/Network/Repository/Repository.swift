//
//  Repository.swift
//  Test
//
//  Created by Muhammad Zahid Imran on 11/11/19.
//  Copyright © 2019 24. All rights reserved.
//

import Foundation
import Alamofire

typealias NetworkRequest = DataRequest

protocol RepositoryProtocol {
    
}


/**
 
Movie Repository Protocol defines protocol for movie repository
 
*/

protocol MovieRepositoryProtocol: RepositoryProtocol {
    /**
    Fetch popular movies with paginated.

    - Parameter page: Number of page to load.

    - Parameter completion: Completion block
    
    - Parameter response: Pageable movie object returned on API success
     
    - Parameter error: Error on API failure

    - Returns: New network request refrence.
    */
    
    func getPopular(page: Int, completion: @escaping (_ response: Pageable<Movie>?, _ error: Error?) -> Void) -> NetworkRequest
    
    /**
    Get movie detail for movie ID.

    - Parameter id: Movie ID to fetch details

    - Parameter completion: Completion block
    
    - Parameter response: Movie detail returned on API success
     
    - Parameter error: Error on API failure

    - Returns: New network request refrence.
    */
    
    func getMovie(id: Int, completion: @escaping (_ response: MovieDetail?, _ error: Error?) -> Void) -> NetworkRequest
    
    /**
    Get videos list available for movie ID.

    - Parameter id: Movie ID to fetch videos

    - Parameter completion: Completion block
    
    - Parameter response: Videos list returned on API success
     
    - Parameter error: Error on API failure

    - Returns: New network request refrence.
    */
    
    func getVideos(id: Int, completion: @escaping (_ response: VideoResponse?, _ error: Error?) -> Void) -> NetworkRequest
}
