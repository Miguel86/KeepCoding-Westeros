//
//  RepositoryTests.swift
//  WesterosTests
//
//  Created by Miguel Dos Santos Carregal on 13/02/2018.
//  Copyright © 2018 Miguel Dos Santos Carregal. All rights reserved.
//

import XCTest
@testable import Westeros

class RepositoryTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLocalRepositoryCreation() {
        let local = Repository.local
        XCTAssertNotNil(local)
    }
    
    func testLocalRepositoryHousesCreation() {
        let houses = Repository.local.houses
        XCTAssertNotNil(houses)
        XCTAssertEqual(houses.count, 2)
        
    }
    
    
    
    
}
