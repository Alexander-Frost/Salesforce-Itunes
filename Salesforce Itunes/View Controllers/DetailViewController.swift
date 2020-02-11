//
//  DetailViewController.swift
//  Salesforce Itunes
//
//  Created by Alex on 2/11/20.
//  Copyright © 2020 Weekend. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: - Properties
    
    var myTitle: String?
    var director: String?
    var avatarUrl: String?
    
    // MARK: - Instances
    
    private let movieController = MovieController()
    
    // MARK: - Outlets
    
    @IBOutlet weak var directorLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Actions
    
    @IBAction func saveBtnPressed(_ sender: UIBarButtonItem) {
        guard let title = myTitle else {return}
        guard let director = director else {return}
        guard let avatarUrl = avatarUrl else {return}

        movieController.create(title: title, director: director, avatarUrl: avatarUrl)
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - VC Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }
    

    // MARK: - Setup UI
    
    private func setupUI(){
        guard let title = myTitle else {return}
        guard let director = director else {return}
        guard let avatarUrl = avatarUrl else {return}
        
        // Director Label
        directorLbl.text = director
        
        // Title Label
        titleLbl.text = title
        
        // Image View
        let myImgUrl = URL(string: avatarUrl) ?? URL(string: "https://www.google.com/favicon.ico")!
        imageView.downloaded(url: myImgUrl)
        imageView.layer.cornerRadius = 8.0
        imageView.layer.masksToBounds = true
    }

}
