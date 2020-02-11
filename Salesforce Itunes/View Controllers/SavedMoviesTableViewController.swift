//
//  SavedMoviesTableViewController.swift
//  Salesforce Itunes
//
//  Created by Alex on 2/11/20.
//  Copyright © 2020 Weekend. All rights reserved.
//

import UIKit
import CoreData

class SavedMoviesTableViewController: UITableViewController {

    // MARK: - Core Data
     
     private var savedMovies: [Movies] {
         let request: NSFetchRequest<Movies> = Movies.fetchRequest()
         request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
         
         guard let myMovies = try? CoreDataStack.shared.mainContext.fetch(request) else {return []}
         return myMovies
     }
    
    // MARK: - VC Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return savedMovies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = savedMovies[indexPath.row].title
        cell.detailTextLabel?.text = savedMovies[indexPath.row].director

        return cell
    }
}
