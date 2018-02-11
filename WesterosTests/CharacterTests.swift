//
//  CharacterTests.swift
//  WesterosTests
//
//  Created by Miguel Dos Santos Carregal on 11/2/18.
//  Copyright © 2018 Miguel. All rights reserved.
//

import XCTest

class CharacterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCharacterExistence(){
        let character = Character()
        XCTAssertNotNil(character)
    }
}
