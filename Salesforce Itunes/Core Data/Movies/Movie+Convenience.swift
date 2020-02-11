//
//  Movie+Convenience.swift
//  Salesforce Itunes
//
//  Created by Alex on 2/11/20.
//  Copyright © 2020 Weekend. All rights reserved.
//

import Foundation
import CoreData

extension Movies {
    
    convenience init(title: String, director: String, avatarUrl: String, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context)
        
        self.title = title
        self.director = director
        self.avatarUrl = avatarUrl
    }
    
    // creates Movie from MovieRepresentation
    convenience init?(movieRepresentation: MovieRepresentation, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) { // optional bc it may not pull data from backend
        self.init(title: movieRepresentation.title, director: movieRepresentation.director, avatarUrl: movieRepresentation.avatarUrl, context: context)
    }
    
    // converts Movie to MovieRepresentation before going to JSON
    var movieRepresentation: MovieRepresentation? {
        guard let title = title, let director = director, let avatarUrl = avatarUrl else {return nil}
                
        return MovieRepresentation(title: title, director: director, avatarUrl: avatarUrl)
    }
}
