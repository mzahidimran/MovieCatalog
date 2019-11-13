//
//  Repository.swift
//  Test
//
//  Created by Muhammad Zahid Imran on 11/11/19.
//  Copyright © 2019 24. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

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
    
    - Parameter response: Pageable **MovieModelProtocol** object returned on API success
     
    - Parameter error: Error on API failure

    - Returns: New network request refrence.
    */
    
    func getPopular<T>(page: Int, completion: @escaping (_ response: Pageable<T>?, _ error: Error?) -> Void) -> NetworkRequest where T: MovieModelProtocol, T: Mappable
    
    /**
    Get movie detail for movie ID.

    - Parameter id: Movie ID to fetch details

    - Parameter completion: Completion block
    
    - Parameter response: **MovieModelProtocol** detail returned on API success
     
    - Parameter error: Error on API failure

    - Returns: New network request refrence.
    */
    
    func getMovie<T>(id: Int, completion: @escaping (_ response: T?, _ error: Error?) -> Void) -> NetworkRequest  where T: MovieModelProtocol, T: Mappable
    
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
