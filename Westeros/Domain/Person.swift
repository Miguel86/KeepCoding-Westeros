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
        return _alias ?? ""
    }
    
    init(name: String, alias: String? = nil, house: House) {
        self.name = name
        _alias = alias
        self.house = house
    }
}

extension Person {
    var fullName: String{
        return "\(name) \(house.name)"
    }
}
// MARK: - Proxies
extension Person {
    var proxy: String{
        return "\(name) \(alias) \(house.name)"
    }
}
// MARK: - Hashable
extension Person : Hashable {
    var hashValue: Int{
        return proxy.hashValue
    }
}
// MARK: - Equatable
extension Person : Equatable {
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy == rhs.proxy
    }
    
    
}
