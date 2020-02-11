//
//  Salesforce_ItunesTests.swift
//  Salesforce ItunesTests
//
//  Created by Alex on 2/11/20.
//  Copyright © 2020 Weekend. All rights reserved.
//

import XCTest
@testable import Salesforce_Itunes

class Salesforce_ItunesTests: XCTestCase {

    // MARK: - Properties
    
    private var searchVC: SearchResultController!

    // MARK: - Lifecycle
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        searchVC = SearchResultController()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: - Tests
    
    func testAddSearch() {
        XCTAssertEqual(searchVC.searchResults.count, 0)
        
        let result = SearchResult(title: "Avengers", creator: "Marvel", posterUrl: "https://upload.wikimedia.org/wikipedia/en/0/0d/Avengers_Endgame_poster.jpg")
        searchVC.searchResults.append(result)
        
        XCTAssertEqual(searchVC.searchResults.count, 1)
    }
    
    func testSearchApiEndpoint() {
        let baseURL = URL(string: "https://itunes.apple.com/search")!

        XCTAssertEqual(searchVC.baseURL, baseURL)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
