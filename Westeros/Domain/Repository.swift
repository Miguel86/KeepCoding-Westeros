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
    typealias FilterSeason = (Season) -> Bool
    var seasons: [Season] { get }
    func season(named: String) -> Season?
    func seasons(filteredBy: FilterSeason) -> [Season]
}
final class LocalFactory: HouseFactory, SeasonFactory {
    
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
    
    func house(named: HouseName) -> House? {
        return house(named: named.rawValue)
    }
    
    func houses(filteredBy: Filter) -> [House] {
        //return houses.filter { $0 == filteredBy}
        //return Repository.local.houses.filter(filteredBy)
        return houses.filter(filteredBy)
    }
    
    var seasons: [Season] {
        let season1 = Season(name: "Season 1", releaseDate: Date(dateString: "2011-04-17"), plot: "The first season of the fantasy drama television series Game of Thrones premiered on HBO on April 17, 2011, at 9.00 pm in the U.S., and concluded on June 19, 2011. It consists of ten episodes, each of approximately 55 minutes. The series is based on A Game of Thrones, the first novel in the A Song of Ice and Fire series by George R. R. Martin, adapted for television by David Benioff and D. B. Weiss. HBO had ordered a television pilot in November 2008; filming began the following year. However, it was deemed unsatisfactory and later reshot with some roles being recast. In March 2010, HBO ordered the first season, which began filming in July 2010, primarily in Belfast, Northern Ireland, with additional filming in Malta. The story takes place in a fictional world, primarily upon a continent called Westeros, with one storyline occurring on another continent to the east known as Essos. Like the novel, the season initially focuses on the family of nobleman Eddard Stark, who is asked to become chief advisor to his king and longtime friend, Robert Baratheon. Ned must find out who killed the previous Hand of the King, Jon Arryn, while trying to protect his family from their rivals the Lannisters. He uncovers the dark secrets about the Lannisters that his predecessor died trying to expose. Meanwhile, in Essos, the exiled Viserys Targaryen, son of the former king, believes he still has the rightful claim to the throne. Game of Thrones features a large ensemble cast, including Sean Bean, Mark Addy, Peter Dinklage, Lena Headey, Nikolaj Coster-Waldau, Michelle Fairley and Iain Glen. Newer actors were cast as the younger generation of characters, such as Kit Harington, Sophie Turner and Maisie Williams. Critics praised the show's production values and cast, with specific accolades for Dinklage's portrayal of Tyrion Lannister. The first season won two of the thirteen Emmy Awards for which it was nominated, for Outstanding Supporting Actor in a Drama Series (Dinklage) and Outstanding Main Title Design. It also received a nomination for Outstanding Drama Series. Bean and Emilia Clarke also received individual accolades, as did Ramin Djawadi for music. U.S. viewership rose by approximately 33% over the course of the season, from 2.2 million to over 3 million by the finale.", image: UIImage(named: "s01.jpg")!)
        let season2 = Season(name: "Season 2", releaseDate: Date(dateString: "2012-04-01"), plot: "The second season of the fantasy drama television series Game of Thrones premiered in the United States on HBO on April 1, 2012, and concluded on June 3, 2012. It was broadcast on Sunday at 9:00 pm in the United States, consisting of 10 episodes, each running approximately 50–60 minutes. The season mostly covers the events of A Clash of Kings, the second novel of the A Song of Ice and Fire series by George R. R. Martin, adapted for television by David Benioff and D. B. Weiss. HBO ordered the second season on April 19, 2011, which began filming in July 2011, primarily in Ireland, Northern Ireland, Croatia and Iceland. The story takes place in a fictional world, primarily upon a continent called Westeros, with one storyline occurring on another continent to the east known as Essos. Like the novel, the season follows the dramatic death of Lord Eddard \"Ned\" Stark, with all of the Starks being separated across Westeros. Season two mainly centres around the War of the Five Kings, fought between the leaders of Westerosi factions who are either staking a claim on the Iron Throne, or seeking independence from it. Game of Thrones features a large ensemble cast, including Peter Dinklage, Lena Headey, Nikolaj Coster-Waldau, Michelle Fairley and Emilia Clarke. The season introduced a number of new cast members, including Stephen Dillane, Natalie Dormer, Carice van Houten and Liam Cunningham. Critics praised the show's production values and cast. Viewership rose compared to the previous season. The second season won six of the eleven Emmy Awards for which it was nominated. It received a nomination for Outstanding Supporting Actor in a Drama Series (Peter Dinklage) and Outstanding Drama Series. U.S. viewership rose by approximately 8% over the course of the season, from 3.9 million to 4.2 million by the season finale." , image: UIImage(named: "s02.jpg")!)
        let season3 = Season(name: "Season 3", releaseDate: Date(dateString: "2013-03-31"), plot: "The third season of the fantasy drama television series Game of Thrones premiered in the United States on HBO on March 31, 2013, and concluded on June 9, 2013. It was broadcast on Sunday at 9:00 pm in the United States, consisting of 10 episodes, each running approximately 50–60 minutes.[1] The season is based roughly on the first half of A Storm of Swords (the third of the A Song of Ice and Fire novels by George R. R. Martin, of which the series is an adaptation).[2] The series is adapted for television by David Benioff and D. B. Weiss. HBO renewed the series for a third season on April 10, 2012, nine days after the second season's premiere. Production began in July 2012.[3] The show was filmed primarily in Ireland, Northern Ireland, Croatia, Iceland and Morocco. The story takes place in a fictional world, primarily upon a continent called Westeros, with one storyline occurring on another continent to the east known as Essos. Like the novel, the season follows the climactic battle at Kings Landing. Season three like the previous season mainly centers around the war of the five kings; after the death of Renly Baratheon, all four kings in Westeros believes to have a claim to the Iron Throne, besides Robb Stark, who seeks vengeance for the death of his father, Lord Eddard \"Ned\" Stark. Game of Thrones features a large ensemble cast, including Peter Dinklage, Nikolaj Coster-Waldau, Lena Headey, Emilia Clarke and Kit Harington. The season introduced a number of new cast members, including Ciarán Hinds, Nathalie Emmanuel and Iwan Rheon. Critics praised the show's production values and cast. Viewership yet again rose compared to the previous season. It won 2 of the 16 Emmy Awards for which it was nominated, it received a nomination for Outstanding Supporting Actor in a Drama Series (Dinklage), Outstanding Supporting Actress in a Drama Series (Clarke) and Outstanding Drama Series. It also won the Critics' Choice Television Award for Best Drama Series." , image: UIImage(named: "s03.jpg")!)
        let season4 = Season(name: "Season 4", releaseDate: Date(dateString: "2014-04-06"), plot: "The fourth season of the fantasy drama television series Game of Thrones premiered in the United States on HBO on April 6, 2014, and concluded on June 15, 2014. It was broadcast on Sunday at 9:00 pm in the United States, consisting of 10 episodes, each running approximately 50–60 minutes.[1] The season is adapted primarily from the second half of A Storm of Swords, along with elements of A Feast for Crows and A Dance with Dragons, all novels from the A Song of Ice and Fire series by George R. R. Martin.[2] The series is adapted for television by David Benioff and D. B. Weiss. HBO ordered the fourth season on April 2, 2013, which began filming in July 2013. The season was filmed primarily in Ireland, Northern Ireland and Croatia. The story takes place in a fictional world, primarily upon a continent called Westeros, with one storyline occurring on another continent to the east known as Essos. Like the novel, the season like the previous seasons mainly centres around the war of the five kings; after the death of Robb Stark at The Red Wedding, all three remaining kings in Westeros believe to have a claim to the Iron Throne. Meanwhile, at the wall, Jon Snow and the Night's Watch get ready for the battle against the free folk. Game of Thrones features a large ensemble cast, including Peter Dinklage, Nikolaj Coster-Waldau, Lena Headey, Emilia Clarke and Kit Harington. The season introduced a number of new cast members, including Pedro Pascal, Indira Varma, Michiel Huisman and Dean-Charles Chapman. Critics praised the show's production values and cast, with specific accolades for Dinklage's portrayal of Tyrion Lannister. Viewership yet again rose compared to the previous season. It won 4 of the 19 Emmy Awards for which it was nominated.", image: UIImage(named: "s04.jpg")!)
        let season5 = Season(name: "Season 5", releaseDate: Date(dateString: "2015-04-12"), plot: "The fifth season of the fantasy drama television series Game of Thrones premiered on HBO on April 12, and concluded on June 14, 2015.[1] It was broadcast on Sunday at 9:00 pm in the United States, consisting of 10 episodes, each running approximately 50–60 minutes. The season primarily adapts material from A Feast for Crows and A Dance with Dragons, the fourth and fifth novels in George R. R. Martin's A Song of Ice and Fire series, though it also uses elements from the third novel, A Storm of Swords, as well as the upcoming sixth novel The Winds of Winter.[2][3][4] It also contains original content not found in Martin's novels.[5] The series is adapted for television by David Benioff and D. B. Weiss. HBO ordered the fifth season on April 8, 2014, together with the sixth season, which began filming in July 2014.[6] The season was filmed primarily in Ireland, Northern Ireland, Croatia and Spain. Game of Thrones features a large ensemble cast, including Peter Dinklage, Nikolaj Coster-Waldau, Lena Headey, Emilia Clarke and Kit Harington. The season introduced a number of new cast members, including Jonathan Pryce and Alexander Siddig. Critics praised the show's production values and cast, with specific accolades for Dinklage's portrayal of Tyrion Lannister. Viewership yet again rose compared to the previous season. This season set a Guinness World Records for winning the highest number of Emmy Awards for a series in a single season and year, winning 12 out of 24 nominations, including Outstanding Drama Series.[7][8]", image: UIImage(named: "s05.png")!)
        let season6 = Season(name: "Season 6", releaseDate: Date(dateString: "2016-04-24"), plot:"The sixth season of the fantasy drama television series Game of Thrones premiered on HBO on April 24, 2016, and concluded on June 26, 2016. It consists of ten episodes, each of approximately 50–60 minutes long, largely of original content not found in George R. R. Martin's A Song of Ice and Fire series. Some story elements were derived from the novels and from information Martin revealed to the show-runners.[1] The series was adapted for television by David Benioff and D. B. Weiss. HBO ordered the season on April 8, 2014, together with the fifth season, which began filming in July 2015[2][3] primarily in Northern Ireland, Spain, Croatia, Iceland and Canada. Each episode cost over $10 million. The season follows the continuing struggle between the Starks and other noble families of Westeros for the Iron Throne. The Starks defeat the Bolton forces in battle, and Jon Snow is proclaimed the King in the North. Tyrion attempts to rule Meereen while Daenerys is held captive by a Dothraki tribe. At King's Landing, the Tyrell army attempts to liberate Margaery and Loras, but Margaery capitulates to the High Sparrow, who becomes more powerful by influencing King Tommen. At her trial, Cersei burns the Great Sept, killing her rivals, while Tommen kills himself. Cersei is crowned Queen of the Seven Kingdoms. Ellaria Sand and three of Oberyn Martell's daughters kill Doran and Trystane Martell and seize control of Dorne. In Essos, Daenerys Targaryen is captured by Khal Moro who takes her before the khals; she burns them alive and takes command of the Dothraki. Olenna and the Dornish ally with Daenerys. Game of Thrones features a large ensemble cast, including Peter Dinklage, Nikolaj Coster-Waldau, Lena Headey, Emilia Clarke and Kit Harington. The season introduced new cast members, including Max von Sydow, Pilou Asbæk and Essie Davis. Critics praised its production values, writing, plot development, and cast. Game of Thrones received most nominations for the 68th Primetime Emmy Awards, with 23 nominations, and won twelve, including that for Outstanding Drama Series for the second year in a row. U.S. viewership rose compared to the previous season, and by approximately 13% over its course, from 7.9 million to 8.9 million by the finale.", image: UIImage(named: "s06.jpg")!)
        let season7 = Season(name: "Season 7", releaseDate: Date(dateString: "2017-07-16"), plot: "The seventh season of the fantasy drama television series Game of Thrones premiered on HBO on July 16, 2017, and concluded on August 27, 2017.[1][2][3] Unlike previous seasons that consisted of ten episodes each, the seventh season consisted of only seven.[4] Like the previous season, it largely consisted of original content not found in George R. R. Martin's A Song of Ice and Fire series, while also incorporating material Martin revealed to showrunners about the upcoming novels in the series.[5][better source needed] The series was adapted for television by David Benioff and D. B. Weiss. The penultimate season focuses primarily on the convergence of the show's main plotlines, featuring major events such as Daenerys Targaryen arriving in Westeros with her army and three dragons and waging war against the Lannisters, Jon Snow forging an alliance with Daenerys in an attempt to unite their forces against the White Walker army, Arya and Bran returning to Winterfell and reuniting with their sister Sansa, and the army of the dead breaching the Wall (with the help of a reanimated wight dragon) and entering the Seven Kingdoms. HBO ordered the seventh season on April 21, 2016, three days before the premiere of the show's sixth season, and began filming on August 31, 2016. The season was filmed primarily in Northern Ireland, Spain, Croatia and Iceland. Game of Thrones features a large ensemble cast, including Peter Dinklage, Nikolaj Coster-Waldau, Lena Headey, Emilia Clarke, and Kit Harington. The season introduces several new cast members, including Jim Broadbent and Tom Hopper.", image: UIImage(named: "s07.png")!)
        
        let episodeS01E01 = Episode(title: "S01E01 - Winter is Coming", summary: "Lord Eddard Stark, ruler of the North, is summoned to court by his old friend, King Robert Baratheon, to serve as the King's Hand. Eddard reluctantly agrees after learning of a possible threat to the King's life. Eddard's bastard son Jon Snow must make a painful decision about his own future, while in the distant east Viserys Targaryen plots to reclaim his father's throne, usurped by Robert, by selling his sister in marriage.", airDate: Date(dateString: "2011-04-17"), image: UIImage(named: "s01e01.jpg")!, season: season1)
        let episodeS01E02 = Episode(title: "S01E02 - The Kingsroad", summary: "An incident on the Kingsroad threatens Eddard and Robert's friendship. Jon and Tyrion travel to the Wall, where they discover that the reality of the Night's Watch may not match the heroic image of it.", airDate: Date(dateString: "2011-04-24"), image: UIImage(named: "s01e02.jpg")!, season: season1)
        season1.add(episodes: episodeS01E01, episodeS01E02)
        
        let episodeS02E01 = Episode(title: "S02E01 - The North Remembers", summary: "War grips the continent of Westeros. As Tyrion Lannister tries to take his strong-willed nephew in hand in King's Landing, Stannis Baratheon launches his own campaign to take the Iron Throne with the help of a mysterious priestess. In the east, Daenerys must lead her retinue through a desolate wasteland whilst beyond the Wall the Night's Watch seeks the aid of a wildling.", airDate: Date(dateString: "2012-04-01"), image: UIImage(named: "s02e01.jpg")!, season: season2)
        let episodeS02E02 = Episode(title: "S02E02 - The Night Lands", summary: "Stannis uses Ser Davos to seek out new allies for his war with the Lannisters. On the road north, Arya confides in Gendry. Robb Stark sends Theon Greyjoy to win an alliance with his father and the fierce warriors of the Iron Islands. Cersei and Tyrion clash on how to rule in King's Landing.", airDate: Date(dateString: "2012-04-08"), image: UIImage(named: "s02e02.jpg")!, season: season2)
        season2.add(episodes: episodeS02E01, episodeS02E02)
        
        let episodeS03E01 = Episode(title: "S03E01 - Valar Dohaeris", summary: "Jon is brought before Mance Rayder, the King Beyond the Wall, while the Night's Watch survivors retreat south. In King's Landing, Tyrion asks for his reward. Littlefinger offers Sansa a way out. Cersei hosts a dinner for the royal family. Daenerys sails into Slaver's Bay.", airDate: Date(dateString: "2013-03-31"), image: UIImage(named: "s03e01.jpg")!, season: season3)
        let episodeS03E02 = Episode(title: "S03E02 - Dark Wings, Dark Words", summary: "Sansa (Sophie Turner) says too much. Shae (Sibel Kekilli) asks Tyrion (Peter Dinklage) for a favor. Jaime (Nikolaj Coster-Waldau) finds a way to pass the time. Arya (Maisie Williams) runs into the Brotherhood Without Banners.", airDate: Date(dateString: "2013-04-07"), image: UIImage(named: "s03e02.jpg")!, season: season3)
        season3.add(episodes: episodeS03E01, episodeS03E02)
        
        let episodeS04E01 = Episode(title: "S04E01 - Two Swords", summary: "Tyrion (Peter Dinklage) welcomes a guest to King's Landing. At Castle Black, Jon Snow (Kit Harington) finds himself unwelcome. Dany (Emilia Clarke) is pointed to Meereen, the mother of all slave cities. Arya (Maisie Williams) runs into an old friend.", airDate: Date(dateString: "2014-04-06"), image: UIImage(named: "s04e01.jpg")!, season: season4)
        let episodeS04E02 = Episode(title: "S04E02 - The Lion and the Rose", summary: "Tyrion lends Jaime (Nikolaj Coster-Waldau) a hand. Joffrey (Jack Gleeson) and Margaery (Natalie Dormer) host a breakfast. At Dragonstone, Stannis (Stephen Dillane) loses patience with Davos (Liam Cunningham). Ramsay (Iwan Rheon) finds a purpose for his pet. North of the Wall, Bran (Isaac Hempstead Wright) sees where they must go.", airDate: Date(dateString: "2014-04-13"), image: UIImage(named: "s04e02.jpg")!, season: season4)
        season4.add(episodes: episodeS04E01, episodeS04E02)
        
        let episodeS05E01 = Episode(title: "S05E01 - The Wars to Come", summary: "In the Season 5 premiere, Varys discusses a conspiracy with Tyrion; Daenerys' rule faces a new threat; Jon finds himself between two kings; and Cersei and Jaime try to move on from Tywin's demise.", airDate: Date(dateString: "2015-04-12"), image: UIImage(named: "s05e01.jpg")!, season: season5)
        let episodeS05E02 = Episode(title: "S05E02 - The House of Black and White", summary: "Arya arrives in Braavos; Brienne and Podrick find danger while traveling; Cersei worries about Myrcella in Dorne when Ellaria Sand seeks revenge for Oberyn's death; Jon is tempted by Stannis.", airDate: Date(dateString: "2015-04-19"), image: UIImage(named: "s05e02.jpg")!, season: season5)
        season5.add(episodes: episodeS05E01, episodeS05E02)
        
        let episodeS06E01 = Episode(title: "S06E01 - The Red Woman", summary: "Jon Snow is dead. Daenerys meets a strong man. Cersei sees her daughter again.", airDate: Date(dateString: "2016-04-24"), image: UIImage(named: "s06e01.jpg")!, season: season6)
        let episodeS06E02 = Episode(title: "S06E02 - Home", summary: "Bran trains with the Three-Eyed Raven. In King's Landing, Jaime advises Tommen. Tyrion demands good news, but has to make his own. At Castle Black, the Night's Watch stands behind Thorne. Ramsay Bolton proposes a plan, and Balon Greyjoy entertains other proposals.", airDate: Date(dateString: "2016-05-01"), image: UIImage(named: "s06e02.jpg")!, season: season6)
        season6.add(episodes: episodeS06E01, episodeS06E02)
        
        let episodeS07E01 = Episode(title: "S07E01 - Dragonstone", summary: "Jon organizes the defense of the North. Cersei tries to even the odds. Daenerys comes home.", airDate: Date(dateString: "2017-07-16"), image: UIImage(named: "s07e01.jpg")!, season: season7)
        let episodeS07E02 = Episode(title: "S07E02 - Stormborn", summary: "Daenerys receives an unexpected visitor. Jon faces a revolt. Tyrion plans the conquest of Westeros.", airDate: Date(dateString: "2017-07-23"), image: UIImage(named: "s07e02.jpg")!, season: season7)
        season7.add(episodes: episodeS07E01, episodeS07E02)
        
        return [season1, season2, season3, season4, season5, season6, season7].sorted()
    }
    
    func season(named name: String) -> Season? {
        let season = seasons.first{ $0.name.uppercased() == name.uppercased() }
        return season
    }
    
    
    func seasons(filteredBy: FilterSeason) -> [Season] {
        return seasons.filter(filteredBy)
    }
    
}








