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
        season1 = Season(name: "Season 1", releaseDate: Date(dateString: "2011-04-17"))
        
        winterIsComing = Episode(title: "S01E01 - Winter is comming", airDate: Date(dateString: "2011-04-17"), season: season1)
        theKingsroad = Episode(title: "S01E02 - The Kingsroad", airDate: Date(dateString: "2011-04-24"), season: season1)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testEpisodeExistance() {
        XCTAssertNotNil(winterIsComing)
        XCTAssertNotNil(theKingsroad)
    }
    
    func testEpisodeEquality() {
        XCTAssertEqual(winterIsComing, winterIsComing)
    }
    
    func testEpisodeComparison() {
        XCTAssertLessThan(winterIsComing, theKingsroad)
    }
    
    func testEpisodeDescription() {
        XCTAssertEqual(winterIsComing.description, "Episode: \(winterIsComing.title)")
    }
}
