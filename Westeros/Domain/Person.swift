//
//  Character.swift
//  Westeros
//
//  Created by Miguel Dos Santos Carregal on 11/2/18.
//  Copyright © 2018 Miguel. All rights reserved.
//
import Foundation

final class Person {
    let name: String
    let house: House
    /* En caso de que _alias tenga contenido devolvera ese valor y sino una cadena vacía. */
    private let _alias: String?
    var alias : String{
        if let _alias = _alias{
            //Existe y esta en _alias
            return _alias
        }
        else{
            return ""
        }
    }
    
    init(name: String, alias: String, house: House) {
        self.name = name
        _alias = alias
        self.house = house
    }
    
    init(name: String, house: House) {
        self.name = name
        self.house = house
        _alias = nil
    }
}
