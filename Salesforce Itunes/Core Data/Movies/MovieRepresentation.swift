//
//  MovieRepresentation.swift
//  Salesforce Itunes
//
//  Created by Alex on 2/11/20.
//  Copyright © 2020 Weekend. All rights reserved.
//

import Foundation

struct MovieRepresentation: Codable, Equatable {
    
    // this needs to exactly match our Firebase data
    var title: String
    var director: String
    var avatarUrl: String
}

// we need to make sure our Firebase data matches our CoreData data

func == (lhs: MovieRepresentation, rhs: Movies) -> Bool {
    return lhs.title == rhs.title && lhs.director == rhs.director && lhs.avatarUrl == rhs.avatarUrl
}

func == (lhs: Movies, rhs: MovieRepresentation) -> Bool {
    return rhs == lhs
}

func != (lhs: MovieRepresentation, rhs: Movies) -> Bool {
    return !(rhs == lhs)
}
