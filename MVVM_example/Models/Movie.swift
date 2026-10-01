//
//  Movie.swift
//  MVVM_example
//
//  Created by Huseyin on 29.09.2026.
//

import Foundation


struct Movie: Decodable {
    let results: [MovieResult]?
        
}

struct MovieResult: Decodable {
    let id: Int?
    let posterPath: String?
    let overview: String?
    let releaseDate: String?
    let title: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case overview
        case releaseDate = "release_date"
        case title
    }
    
    var _id: Int{
        id ?? Int.min
    }
    
    var _posterPath: String{
        //computed property
        posterPath ?? ""
    }
    
    var _title: String {
        title ?? "N/A"
    }
    
    var _releaseDate: String {
        releaseDate ?? "N/A"
    }
    
    var _overview: String {
        overview ?? "There is no overview"
    }
    
}
