
//
//  MovieCatalogVM.swift
//  Test
//
//  Created by Muhammad Zahid Imran on 4/21/19.
//  Copyright © 2019 24. All rights reserved.
//

import Foundation
import Observable
import AlamofireImage

class MovieCatalogVM {
    
    private var page: Int = 0
    private var total_results: Int = 0
    private var total_pages: Int = 0
    
    var filter: String = ""
    {
        didSet {
            applyFilter()
        }
    }
    
    var isSearching: Bool {
        get {
            return filter.count > 0
        }
    }
    
    var isNextPageAvailable:Bool {
        get {
            return page < total_pages
        }
    }
    
    private var source:[Movie] = [] {
        didSet {
            if filter.count == 0 {
                _movies.value = source
            }
        }
    }
    private var _movies:Observable<[Movie]> = Observable<[Movie]>([])
    lazy var movies: ImmutableObservable<[Movie]> = _movies
    
    private var _error:Observable<Error?> = Observable<Error?>(nil)
    lazy var error: ImmutableObservable<Error?> = _error
    
    
    private var _currentRequest: Observable<NetworkRequest?> = Observable<NetworkRequest?>(nil)
    lazy var currentRequest: ImmutableObservable<NetworkRequest?> = _currentRequest
    
    func loadNextPage() -> Void {
        if isSearching { return }
        load(page: page+1)
    }
    
    func load(page:Int = 1) -> Void {
        
        self._error.value = nil
        if _currentRequest.value == nil {
            self._currentRequest.value = Resolver.movieRepository.getPopular(page: page) {[weak self] (result, error) in
                if let result = result {
                    self?.throttleImages(movies: result.results)
                    self?.source.append(contentsOf: result.results)
                    self?.total_results = result.total_results
                    self?.total_pages = result.total_pages
                    self?.page = result.page
                }
                else if let error = error {
                    self?._error.value = error
                }
                self?._currentRequest.value = nil
            }
        }
    }
    
    
    private func throttleImages(movies:[Movie]) {
        for movie in movies {
            if let url = URL(string: Resolver.constants.IMAGE_REPO_BASE_URL + movie.backdrop_path)
            {
                ImageDownloader.default.download(URLRequest(url: url), completion: nil)
            }
        }
    }
    
    private func applyFilter(){
        if isSearching
        {
            self._movies.value = self.source.filter { $0.title.localizedCaseInsensitiveContains(filter) }
        }
        else {
            self._movies.value = self.source
        }
    }
    
    
}

