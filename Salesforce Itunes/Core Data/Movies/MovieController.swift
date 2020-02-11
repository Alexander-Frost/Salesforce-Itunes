//
//  MovieController.swift
//  Salesforce Itunes
//
//  Created by Alex on 2/11/20.
//  Copyright © 2020 Weekend. All rights reserved.
//

import Foundation
import CoreData

class MovieController {
    
    // MARK: - Core Data Persistent Store

    func saveToPersistentStore(){
        let moc = CoreDataStack.shared.mainContext

        do {
            try moc.save() // save to persistent store
        } catch let error {
            print("Error saving moc: \(error)")
        }
    }
    
    // MARK: - CRUD

    func create(title: String, director: String, avatarUrl: String) {
        let _ = Movies(title: title, director: director, avatarUrl: avatarUrl)
        saveToPersistentStore()
    }
    
    func delete(movie: Movies) {
        // 2. Delete from CoreData
//        context.delete(like)
        
        // 3. Save deletion
//        self.saveToPersistentStore()
        
        // This may need to run on the background context we pass in
        if let moc = movie.managedObjectContext {
            moc.delete(movie)
            saveToPersistentStore()
        }
    }
    
    public func fetchSingleMovieFromPersistentStore(title: String, context: NSManagedObjectContext) -> Movies? {
        // 1. Create fetch request from Movie
        let fetchRequest: NSFetchRequest<Movies> = Movies.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "title == %@", title)
        
        var result: Movies?
        
        do {
            // 2. Fetch Like from Core Data store
            result = try context.fetch(fetchRequest).first
        } catch let fetchError {
            print("Error fetching single Movie: \(fetchError.localizedDescription)")
        }
        return result
    }
}

