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
    
    override func setUp() {
        super.setUp()
        season = Season()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSeasonExistance() {
        XCTAssertNotNil(season)
    }
}
