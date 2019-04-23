//
//  MovieDetailVM.swift
//  Test
//
//  Created by Muhammad Zahid Imran on 4/22/19.
//  Copyright © 2019 24. All rights reserved.
//

import Foundation
import UIKit
import Observable

class MovieDetailVM {
    
    private var _videos:Observable<[Video]> = Observable<[Video]>([])
    lazy var videos: ImmutableObservable<[Video]> = _videos
    
    private var _errorVideos:Observable<Error?> = Observable<Error?>(nil)
    lazy var errorVideos: ImmutableObservable<Error?> = _errorVideos
    
    private var _movie:Observable<MovieDetail?> = Observable<MovieDetail?>(nil)
    lazy var movie: ImmutableObservable<MovieDetail?> = _movie
    
    private var _error:Observable<Error?> = Observable<Error?>(nil)
    lazy var error: ImmutableObservable<Error?> = _error
    
    let dateformatter = DateFormatter(withFormat: "dd.MM.yyyy", locale: "en_US")
    
    private var _currentRequest: Observable<NetworkRequest?> = Observable<NetworkRequest?>(nil)
    lazy var currentRequest: ImmutableObservable<NetworkRequest?> = _currentRequest
   
    
    var overview: String {
        get {
            guard let movie = movie.value else {
                return ""
            }
            return movie.overview
        }
    }
    
    var title: String {
        get {
            guard let movie = movie.value else {
                return ""
            }
            return movie.title
        }
    }
    
    var genre: String {
        get {
            guard let movie = movie.value else {
                return ""
            }
            return movie.genres.map { $0.name }.joined(separator: ", ")
        }
    }
    
    var releaseDate:String {
        get {
            guard let movie = movie.value else {
                return ""
            }
            return dateformatter.string(from: movie.release_date)
        }
    }
    
    var bannerURl: URL? {
        get {
            guard let url = movie.value?.backdrop_path else {
                return nil
            }
            return URL(string: Resolver.constants.IMAGE_REPO_BASE_URL + url)
        }
    }
    
    func load(movieID:Int) -> Void {
        self._error.value = nil
        if _currentRequest.value == nil {
            self._currentRequest.value = Resolver.movieRepository.getMovie(id: movieID) {[weak self] (result, error) in
                if let result = result {
                    self?._movie.value = result
                }
                else if let error = error {
                    self?._error.value = error
                }
                self?._currentRequest.value = nil
            }
        }
    }
    
    
    func loadVideos(movieID:Int) -> Void {
        let _ = Resolver.movieRepository.getVideos(id: movieID) {[weak self] (result, error) in
            if let result = result {
                self?._videos.value = result.results
            }
            else if let error = error {
                self?._errorVideos.value = error
            }
        }
    }
    
}
