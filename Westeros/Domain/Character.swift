//
//  Character.swift
//  Westeros
//
//  Created by Miguel Dos Santos Carregal on 11/2/18.
//  Copyright © 2018 Miguel. All rights reserved.
//
import Foundation

final class Character {
    let name: String
    let alias: String
    let house: House
    
    init(name: String, alias: String, house: House) {
        self.name = name
        self.alias = alias
        self.house = house
    }
}
