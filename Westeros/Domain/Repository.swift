//
//  Repository.swift
//  Westeros
//
//  Created by Miguel Dos Santos Carregal on 13/02/2018.
//  Copyright © 2018 Miguel. All rights reserved.
//

import UIKit

final class Repository {
    static let local = LocalFactory()
}

protocol HouseFactory {
    typealias Filter = (House) -> Bool
    var houses: [House] { get }
    func house(named: String) -> House?
    func houses(filteredBy: Filter) -> [House]
}

protocol SeasonFactory {
    var seasons: [Season] { get }
}
final class LocalFactory: HouseFactory {
    
    var houses: [House] {
        // Houses creation here
        let starkSigil = Sigil(image: UIImage(named: "codeIsComing.png")!, description: "Lobo Huargo")
        let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "León rampante")
        let targaryenSigil = Sigil(image: UIImage(named: "targaryenSmall.jpg")!, description: "Dragón Tricéfalo")

        let starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno", url: URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")! )
        let lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Oye mi rugido", url: URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!)
        let targaryenHouse = House(name: "Targaryen", sigil: targaryenSigil, words: "Fuego y Sangre", url: URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!)
        
        let robb = Person(name: "Robb", alias: "El Joven Lobo", house: starkHouse)
        let arya = Person(name: "Arya", house: starkHouse)
        
        let tyrion = Person(name: "Tyrion", alias: "El Enano", house: lannisterHouse)
        let cersei = Person(name: "Cersei", house: lannisterHouse)
        let jaime = Person(name: "Jaime", alias: "El Matarreyes", house: lannisterHouse)
        
        let dani = Person(name: "Daenerys", alias: "Madre de Dragones", house: targaryenHouse)
        
        // Add characters to houses
        starkHouse.add(person: arya)
        starkHouse.add(person: robb)
        lannisterHouse.add(person: tyrion)
        lannisterHouse.add(person: cersei)
        lannisterHouse.add(person: jaime)
        targaryenHouse.add(person: dani)
        
        return [starkHouse, lannisterHouse, targaryenHouse].sorted()
    }
    
    func house(named name: String) -> House? {
        //let house = houses.filter{ $0.name.uppercased() == name.uppercased() }.first
        let house = houses.first{ $0.name.uppercased() == name.uppercased() }
        return house
    }
    
    
    func houses(filteredBy: Filter) -> [House] {
        //return houses.filter { $0 == filteredBy}
        //return Repository.local.houses.filter(filteredBy)
        return houses.filter(filteredBy)
    }
    
    var seasons: [Season] {
        let season1 = Season(name: "Season 1", releaseDate: Date(dateString: "2011-04-17"))
        let season2 = Season(name: "Season 2", releaseDate: Date(dateString: "2012-04-01"))
        let season3 = Season(name: "Season 3", releaseDate: Date(dateString: "2013-03-31"))
        let season4 = Season(name: "Season 4", releaseDate: Date(dateString: "2014-04-06"))
        let season5 = Season(name: "Season 5", releaseDate: Date(dateString: "2015-04-12"))
        let season6 = Season(name: "Season 6", releaseDate: Date(dateString: "2016-04-24"))
        let season7 = Season(name: "Season 7", releaseDate: Date(dateString: "2017-07-16"))
        
        let episodeS01E01 = Episode(title: "S01E01 - Winter is Coming", airDate: Date(dateString: "2011-04-17"), season: season1)
        let episodeS01E02 = Episode(title: "S01E02 - The Kingsroad", airDate: Date(dateString: "2011-04-24"), season: season1)
        season1.add(episodes: episodeS01E01, episodeS01E02)
        
        let episodeS02E01 = Episode(title: "S02E01 - The North Remembers", airDate: Date(dateString: "2012-04-01"), season: season2)
        let episodeS02E02 = Episode(title: "S02E02 - The Night Lands", airDate: Date(dateString: "2012-04-08"), season: season2)
        season2.add(episodes: episodeS02E01, episodeS02E02)
        
        let episodeS03E01 = Episode(title: "S03E01 - Valar Dohaeris", airDate: Date(dateString: "2013-03-31"), season: season3)
        let episodeS03E02 = Episode(title: "S03E02 - Dark Wings, Dark Words", airDate: Date(dateString: "2013-04-07"), season: season3)
        season3.add(episodes: episodeS03E01, episodeS03E02)
        
        let episodeS04E01 = Episode(title: "S04E01 - Two Swords", airDate: Date(dateString: "2014-04-06"), season: season4)
        let episodeS04E02 = Episode(title: "S04E02 - The Lion and the Rose", airDate: Date(dateString: "2014-04-13"), season: season4)
        season4.add(episodes: episodeS04E01, episodeS04E02)
        
        let episodeS05E01 = Episode(title: "S05E01 - The Wars to Come", airDate: Date(dateString: "2015-04-12"), season: season5)
        let episodeS05E02 = Episode(title: "S05E02 - The House of Black and White", airDate: Date(dateString: "2015-04-19"), season: season5)
        season5.add(episodes: episodeS05E01, episodeS05E02)
        
        let episodeS06E01 = Episode(title: "S06E01 - The Red Woman", airDate: Date(dateString: "2016-04-24"), season: season6)
        let episodeS06E02 = Episode(title: "S06E02 - Home", airDate: Date(dateString: "2016-05-01"), season: season6)
        season6.add(episodes: episodeS06E01, episodeS06E02)
        
        let episodeS07E01 = Episode(title: "S07E01 - Dragonstone", airDate: Date(dateString: "2017-07-16"), season: season6)
        let episodeS07E02 = Episode(title: "S07E02 - Stormborn", airDate: Date(dateString: "2017-07-23"), season: season6)
        season7.add(episodes: episodeS07E01, episodeS07E02)
        
        return [season1, season2, season3, season4, season5, season6, season7].sorted()
    }
    
}








