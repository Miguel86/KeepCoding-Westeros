//
//  CharacterTests.swift
//  WesterosTests
//
//  Created by Miguel Dos Santos Carregal on 11/2/18.
//  Copyright © 2018 Miguel. All rights reserved.
//

import XCTest
@testable import Westeros
class PersonTests: XCTestCase {
    var startkHouse: House!
    var starkSigil: Sigil!
    
    override func setUp() {
        super.setUp()
        starkSigil = Sigil(image: UIImage(), description: "Lobo Huargo")
        startkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno")
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCharacterExistence(){
        
        let ned = Person(name: "Eddard", alias: "Ned", house: startkHouse)
        XCTAssertNotNil(ned)
        
        
        let arya = Character(name: "Arya", house: startkHouse)
        XCTAssertNotNil(arya)
    }
}