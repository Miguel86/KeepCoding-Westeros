//
//  House.swift
//  Westeros
//
//  Created by Miguel Dos Santos Carregal on 11/2/18.
//  Copyright © 2018 Miguel. All rights reserved.
//

import UIKit

typealias Words = String

final class Sigil{
    let description: String
    let image: UIImage
    
    init(image: UIImage, description: String){
        self.description = description
        self.image = image
    }
}

final class House{
    let name: String
    let sigil: Sigil
    let words: Words
    
    init(name: String, sigil: Sigil, words: Words){
        self.name = name
        self.sigil = sigil
        self.words = words
    }
}
