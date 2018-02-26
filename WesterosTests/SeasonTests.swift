//
//  SeasonTests.swift
//  WesterosTests
//
//  Created by Miguel Dos Santos Carregal on 26/2/18.
//  Copyright © 2018 Miguel. All rights reserved.
//

import XCTest
@testable import Westeros

class SeasonTests: XCTestCase {
    
    var season: Season!
    var season2: Season!
    
    override func setUp() {
        super.setUp()
        season = Season(name: "Season 1", releaseDate: Date(dateString: "2011-04-17"))
        season2 = Season(name: "Season 2", releaseDate: Date(dateString: "2012-04-01"))
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSeasonExistance() {
        XCTAssertNotNil(season)
    }
    
    func testSeasonEquality() {
        XCTAssertEqual(season, season)
    }
    
    func testSeasonComparison() {
        XCTAssertLessThan(season, season2)
    }
    
    func testSeasonDescription() {
        XCTAssertEqual(season.description, "Season: \(season.name)")
    }
}
