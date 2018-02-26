//
//  Season.swift
//  Westeros
//
//  Created by Miguel Dos Santos Carregal on 26/2/18.
//  Copyright © 2018 Miguel. All rights reserved.
//

import Foundation

typealias Episodes = Set<Episode>
final class Season {
    let name: String
    let releaseDate: Date
    private var _episodes: Episodes
    
    init(name: String, releaseDate: Date) {
        self.name = name
        self.releaseDate = releaseDate
        _episodes = Episodes()
    }
}
