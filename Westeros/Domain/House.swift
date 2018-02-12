//
//  House.swift
//  Westeros
//
//  Created by Miguel Dos Santos Carregal on 11/2/18.
//  Copyright © 2018 Miguel. All rights reserved.
//

import UIKit

typealias Words = String
typealias Members = Set<Person>

// MARK: - Sigil
final class Sigil{
    let description: String
    let image: UIImage
    
    init(image: UIImage, description: String){
        self.description = description
        self.image = image
    }
}

// MARK: - House
final class House{
    let name: String
    let sigil: Sigil
    let words: Words
    private var _members: Members
    
    init(name: String, sigil: Sigil, words: Words){
        self.name = name
        self.sigil = sigil
        self.words = words
        _members = Members()
    }
}

extension House {
    var count: Int {
        return _members.count
    }
    
    func add(person: Person){
        guard person.house.name == self.name else{
            return
        }
        _members.insert(person)
    }
}
// MARK - Proxy
extension House{
    var proxyForEquality: String{
        return "\(name) \(words) \(count)"
    }
}

// MARK - Equatable
extension House: Equatable{
    static func ==(lhs: House, rhs: House) -> Bool{
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}
