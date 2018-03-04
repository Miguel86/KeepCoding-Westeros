//
//  Season.swift
//  Westeros
//
//  Created by Miguel Dos Santos Carregal on 26/2/18.
//  Copyright © 2018 Miguel. All rights reserved.
//

import UIKit

typealias Episodes = Set<Episode>
final class Season {
    let name: String
    let releaseDate: Date
    let plot: String
    let image: UIImage
    private var _episodes: Episodes
    
    init(name: String, releaseDate: Date, plot: String, image: UIImage) {
        self.name = name
        self.releaseDate = releaseDate
        self.plot = plot
        self.image = image
        _episodes = Episodes()
    }
    
    convenience init(name: String, releaseDate: Date) {
        self.init(name: name, releaseDate: releaseDate, plot: "", image: UIImage());
    }
}
extension Season {
    func add(episode: Episode) {
        guard episode.season == self else {
            return
        }
        _episodes.insert(episode)
    }
    
    func add(episodes: Episode...){
        episodes.forEach{ add(episode: $0) }
    }
    
    var sortedEpisodes: [Episode] {
        return _episodes.sorted()
    }
}

// MARK: - Proxy
extension Season {
    var proxyEquality: String {
        return "\(name) \(releaseDate)"
    }
    
    var proxyForComparison: String {
        return name.uppercased() //Para no distinguir minusculas y mayusculas.
    }
}

// MARK: - Hashable
extension Season: Hashable {
    var hashValue: Int {
        return proxyEquality.hashValue
    }
}
// MARK: - Equatable
extension Season: Equatable {
    static func ==(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyEquality == rhs.proxyEquality
    }
}

// MARK: - Comparable
extension Season: Comparable {
    static func <(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}

// MARK: - CustomStringConvertible
extension Season: CustomStringConvertible {
    var description: String {
        return "Season: \(name)"
    }
}
