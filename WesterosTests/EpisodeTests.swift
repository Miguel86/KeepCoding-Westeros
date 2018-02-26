//
//  EpisodeTests.swift
//  WesterosTests
//
//  Created by Miguel Dos Santos Carregal on 26/2/18.
//  Copyright © 2018 Miguel. All rights reserved.
//

import XCTest
@testable import Westeros

class EpisodeTests: XCTestCase {
    var season1:Season!
    
    var winterIsComing: Episode!
    var theKingsroad: Episode!
    
    override func setUp() {
        super.setUp()
        season1 = Season(name: "Season 1", releaseDate: Date(dateString: "17/04/2011"))
        
        winterIsComing = Episode(title: "S01E01 - Winter is comming", airDate: Date(dateString: "17/04/2011"), season: season1)
        theKingsroad = Episode(title: "The Kingsroad", airDate: Date(dateString: "24/04/2011"), season: season1)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testEpisodeExistance() {
        XCTAssertNotNil(winterIsComing)
        XCTAssertNotNil(theKingsroad)
    }
}
