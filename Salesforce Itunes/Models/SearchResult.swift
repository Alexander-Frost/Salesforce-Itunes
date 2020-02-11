//
//  SearchResult.swift
//  Salesforce Itunes
//
//  Created by Alex on 2/11/20.
//  Copyright © 2020 Weekend. All rights reserved.
//

import Foundation

struct SearchResult: Codable {
    var title: String
    var creator: String
    var posterUrl: String
    
    // names of the actual keys in the data
    enum CodingKeys: String, CodingKey {
        case title = "trackName"
        case creator = "artistName"
        case posterUrl = "previewURL"
        
//        name, director, year, intro, poster
    }
}

struct SearchResults: Codable {
    let results: [SearchResult]
}
