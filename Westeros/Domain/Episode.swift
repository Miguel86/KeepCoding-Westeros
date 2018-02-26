//
//  Episode.swift
//  Westeros
//
//  Created by Miguel Dos Santos Carregal on 26/2/18.
//  Copyright © 2018 Miguel. All rights reserved.
//

import Foundation

final class Episode{
    let title: String
    let airDate: Date
    weak var season: Season?
    
    init(title: String, airDate: Date, season: Season) {
        self.title = title
        self.airDate = airDate
        self.season = season
    }
}
// MARK: - Proxy
extension Episode {
    var proxyEquality: String {
        return "\(title) \(airDate)"
    }
    
    var proxyForComparison: String {
        return title.uppercased() //Para no distinguir minusculas y mayusculas.
    }
}

// MARK: - Hashable
extension Episode: Hashable {
    var hashValue: Int {
        return proxyEquality.hashValue
    }
}
// MARK: - Equatable
extension Episode: Equatable {
    static func ==(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyEquality == rhs.proxyEquality
    }
}

// MARK: - Comparable
extension Episode: Comparable {
    static func <(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}
