//
//  MovieRepository.swift
//  Test
//
//  Created by Muhammad Zahid Imran on 4/22/19.
//  Copyright © 2019 24. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class Repository {
    
    func request<T: Mappable>(requestConverter: RequestConverter, completion:@escaping (T?, Error?) -> Void) -> NetworkRequest {
        return Alamofire.request(requestConverter).validate().responseObject { (response:DataResponse<T>) in
            switch response.result {
            case .success(let value):
                completion(value, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
}
