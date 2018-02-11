//
//  HouseTests.swift
//  WesterosTests
//
//  Created by Miguel Dos Santos Carregal on 11/2/18.
//  Copyright © 2018 Miguel. All rights reserved.
//

import XCTest
@testable import Westeros
class HouseTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    func testHouseExistence(){
        //given
        //when
        //then
        let startSigil = Sigil(image: UIImage(), description: "Lobo huarto")
        let stark = House(name: "Stark", sigil: startSigil, words: "Se acerca el invierno")
        XCTAssertNotNil(stark)
    }
    
    func testSigilExistence(){
        let starkSigil = Sigil(image: UIImage(), description: "Logo Huargo")
        XCTAssertNotNil(starkSigil)
        
        let lannisterSigil = Sigil(image: UIImage(), description: "Leon rampante")
        XCTAssertNotNil(lannisterSigil)
    }
    
}
