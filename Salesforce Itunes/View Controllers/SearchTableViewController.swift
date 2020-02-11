//
//  SearchTableViewController.swift
//  Salesforce Itunes
//
//  Created by Alex on 2/11/20.
//  Copyright © 2020 Weekend. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchBarDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - Instances
    
    let searchResultsController = SearchResultController()
    
    // MARK: - VC Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResultsController.searchResults.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // get the array result at our index path
        let searchResult = searchResultsController.searchResults[indexPath.row]
        
        cell.textLabel?.text = searchResult.title
        cell.detailTextLabel?.text = searchResult.creator
        
        return cell
    }
    
    // MARK: - Search
    
    func searchBarSearchButtonClicked(_: UISearchBar){
        
        // holds segment control selection
        var resultType: ResultType! = .movie
        
        // set search term
        guard let searchTerm = searchBar.text else {return}
        
        // call search function
        searchResultsController.performSearch(searchTerm: searchTerm, resultType: resultType, completion:{error in
            if let error = error {
                print("There was an error: \(error)")
            } else {
                print("performSearch has run.")
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }})
    }
}
