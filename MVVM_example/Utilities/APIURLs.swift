//
//  APIURLs.swift
//  MVVM_example
//
//  Created by Huseyin on 29.09.2026.
//

import Foundation

enum APIURLs {
    static func movies(page: Int) -> String {
        "https://api.themoviedb.org/3/movie/popular?api_key=3671f76b5ef98de5be50bc39e9cd7435&language=tr-TR&page=\(page)"
    }
    
    static func imageURL(posterPath: String) -> String {
        "https://image.tmdb.org/t/p/w500\(posterPath)"
    }
    
    static func detail(id: Int) -> String {
        "https://api.themoviedb.org/3/movie/\(id)?api_key=3671f76b5ef98de5be50bc39e9cd7435&language=tr-TR"
    }
    
}
