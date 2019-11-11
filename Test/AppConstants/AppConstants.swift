//
//  Environment.swift
//  Test
//
//  Created by Muhammad Zahid Imran on 4/22/19.
//  Copyright © 2019 24. All rights reserved.
//

import Foundation


/**
 
App constants singleton cannot be initialized only accessible *shared*

*/


struct AppConstants {
    
    static let shared = AppConstants()
    
    let BASE_URL = "https://api.themoviedb.org/3/"
    let MOVIE_DB_API_KEY = "17af35719714aa706ad0731b2f21ffad"
    let IMAGE_REPO_BASE_URL = "https://image.tmdb.org/t/p/w342"
    
    private init () {}
}

