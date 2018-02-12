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
    var lannisterkHouse: House!
    
    var starkSigil: Sigil!
    var lannisterSigil: Sigil!
    
    var robb: Person!
    var arya: Person!
    var tyrion: Person!
    
    override func setUp() {
        super.setUp()
        starkSigil = Sigil(image: UIImage(), description: "Lobo Huargo")
        lannisterSigil = Sigil(image: UIImage(), description: "León rampante")
        
        startkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno")
        lannisterkHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Oye mi rugido")
        
        robb = Person(name: "Robb", alias: "El joven Lobo", house: startkHouse)
        arya = Person(name: "Arya", house: startkHouse)
        
        tyrion = Person(name: "Tyrion", alias: "El Enano", house: lannisterkHouse)
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCharacterExistence(){
        XCTAssertNotNil(robb)
        XCTAssertNotNil(arya)
    }
    
    func testFullName(){
        XCTAssertEqual(robb.fullName, "Robb Stark")
    }
    
    func testPersonEquality(){
        //Identidad
        XCTAssertEqual(tyrion, tyrion)
        
        //Igualdad
        let enano = Person(name:"Tyrion", alias: "El Enano", house: lannisterkHouse)
        XCTAssertEqual(enano, tyrion)
        
        //Desigualdad
        XCTAssertNotEqual(tyrion, arya)
    }
    
}
