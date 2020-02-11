//
//  SearchTableViewController.swift
//  Salesforce Itunes
//
//  Created by Alex on 2/11/20.
//  Copyright © 2020 Weekend. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchBarDelegate {
    
    // MARK: - Properties
    
    var selectedAvatarUrl: String?
    var selectedTitle: String?
    var selectedDirector: String?
    
    // MARK: - Outlets
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - Instances
    
    let searchResultsController = SearchResultController()
    
    // MARK: - VC Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? DetailViewController {
            
            guard let avatarUrl = selectedAvatarUrl else {return}
            guard let myTitle = selectedTitle else {return}
            guard let director = selectedDirector else {return}

            detailVC.avatarUrl = avatarUrl
            detailVC.director = director
            detailVC.myTitle = myTitle
        }
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

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let searchResult = searchResultsController.searchResults[indexPath.row]
        selectedTitle = searchResult.title
        selectedDirector = searchResult.creator
        selectedAvatarUrl = searchResult.posterUrl
        performSegue(withIdentifier: "detail segue", sender: self)
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
