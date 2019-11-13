//
//  MockMovieRepository.swift
//  TestTests
//
//  Created by Muhammad Zahid Imran on 11/13/19.
//  Copyright © 2019 24. All rights reserved.
//

import Foundation
@testable import Test
import ObjectMapper

class MockMovieRepository: MovieRepositoryProtocol {
    func getPopular<T>(page: Int, completion: @escaping (Pageable<T>?, Error?) -> Void) -> NetworkRequest where T : Mappable, T : MovieModelProtocol {
        if page == 1 {
            let mappedMovieList = Pageable<T>(JSONString: mockPopularResponse)
            completion(mappedMovieList,nil)
        }
        else{
            let error = NSError(domain: "Unable to load", code: 400, userInfo: nil)
            completion(nil, error)
        }
        return NetworkRequest()
    }
    
    func getMovie<T>(id: Int, completion: @escaping (T?, Error?) -> Void) -> NetworkRequest where T : Mappable, T : MovieModelProtocol {
        if id == 920 {
            let mappedMovieList = T(JSONString: mockMovieDetailResponse)
            completion(mappedMovieList,nil)
        }
        else{
            let error = NSError(domain: "Unable to load", code: 400, userInfo: nil)
            completion(nil, error)
        }
        return nil
    }
    
    func getVideos(id: Int, completion: @escaping (VideoResponse?, Error?) -> Void) -> NetworkRequest {
        
    }
    
    
}



let mockPopularResponse = """
{
  "results" : [
    {
      "popularity" : 556.71500000000003,
      "backdrop_path" : "/n6bUvigpRFqSwmPp1m2YADdbRBc.jpg",
      "poster_path" : "/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg",
      "adult" : false,
      "release_date" : "2019-10-02",
      "overview" : "During the 1980s, a failed stand-up comedian is driven insane and turns to a life of crime and chaos in Gotham City while becoming an infamous psychopathic crime figure.",
      "original_language" : "en",
      "genres" : [],
      "title" : "Joker",
      "vote_count" : 5288,
      "video" : false,
      "vote_average" : 8.5,
      "id" : 475557,
      "original_title" : "Joker"
    },
    {
      "release_date" : "2019-10-23",
      "adult" : false,
      "vote_average" : 6.4000000953674316,
      "genres" : [],
      "overview" : "More than two decades have passed since Sarah Connor prevented Judgment Day, changed the future, and re-wrote the fate of the human race. Dani Ramos is living a simple life in Mexico City with her brother and father when a highly advanced and deadly new Terminator – a Rev-9 – travels back through time to hunt and kill her. Dani's survival depends on her joining forces with two warriors: Grace, an enhanced super-soldier from the future, and a battle-hardened Sarah Connor. As the Rev-9 ruthlessly destroys everything and everyone in its path on the hunt for Dani, the three are led to a T-800 from Sarah’s past that may be their last best hope.",
      "video" : false,
      "popularity" : 263.86900000000003,
      "title" : "Terminator: Dark Fate",
      "poster_path" : "/vqzNJRH4YyquRiWxCCOH0aXggHI.jpg",
      "backdrop_path" : "/a6cDxdwaQIFjSkXf7uskg78ZyTq.jpg",
      "id" : 290859,
      "original_title" : "Terminator: Dark Fate",
      "vote_count" : 494,
      "original_language" : "en"
    },
    {
      "adult" : false,
      "video" : false,
      "vote_average" : 6.6999998092651367,
      "genres" : [],
      "original_language" : "en",
      "overview" : "Lightning McQueen, a hotshot rookie race car driven to succeed, discovers that life is about the journey, not the finish line, when he finds himself unexpectedly detoured in the sleepy Route 66 town of Radiator Springs. On route across the country to the big Piston Cup Championship in California to compete against two seasoned pros, McQueen gets to know the town's offbeat characters.",
      "backdrop_path" : "/a1MlbLBk5Sy6YvMbSuKfwGlDVlb.jpg",
      "title" : "Cars",
      "id" : 920,
      "release_date" : "2006-06-08",
      "vote_count" : 8330,
      "popularity" : 127.498,
      "poster_path" : "/jpfkzbIXgKZqCZAkEkFH2VYF63s.jpg",
      "original_title" : "Cars"
    },
    {
      "release_date" : "2019-12-20",
      "poster_path" : "/vn94LlNrbUWIZZyAdmvUepFBeaY.jpg",
      "original_language" : "cn",
      "title" : "Ip Man 4: The Finale",
      "vote_average" : 0,
      "id" : 449924,
      "popularity" : 170.364,
      "video" : false,
      "adult" : false,
      "vote_count" : 0,
      "original_title" : "葉問4",
      "genres" : [],
      "backdrop_path" : "/ekP6EVxL81lZ4ivcqPsoZ72rY0h.jpg",
      "overview" : "Ip Man 4 is an upcoming Hong Kong biographical martial arts film directed by Wilson Yip and produced by Raymond Wong. It is the fourth in the Ip Man film series based on the life of the Wing Chun grandmaster of the same name and features Donnie Yen reprising the role. The film began production in April 2018 and ended in July the same year."
    },
    {
      "poster_path" : "/2bXbqYdUdNVa8VIWXVfclP2ICtT.jpg",
      "title" : "The Lion King",
      "original_language" : "en",
      "adult" : false,
      "genres" : [],
      "id" : 420818,
      "video" : false,
      "overview" : "Simba idolises his father, King Mufasa, and takes to heart his own royal destiny. But not everyone in the kingdom celebrates the new cub's arrival. Scar, Mufasa's brother—and former heir to the throne—has plans of his own. The battle for Pride Rock is ravaged with betrayal, tragedy and drama, ultimately resulting in Simba's exile. With help from a curious pair of newfound friends, Simba will have to figure out how to grow up and take back what is rightfully his.",
      "release_date" : "2019-07-12",
      "popularity" : 147.202,
      "vote_count" : 3498,
      "vote_average" : 7.0999999046325684,
      "backdrop_path" : "/nRXO2SnOA75OsWhNhXstHB8ZmI3.jpg",
      "original_title" : "The Lion King"
    },
    {
      "video" : false,
      "original_title" : "Maleficent: Mistress of Evil",
      "original_language" : "en",
      "backdrop_path" : "/skvI4rYFrKXS73BJxWGH54Omlvv.jpg",
      "vote_average" : 7.1999998092651367,
      "adult" : false,
      "popularity" : 133.559,
      "release_date" : "2019-10-16",
      "poster_path" : "/tBuabjEqxzoUBHfbyNbd8ulgy5j.jpg",
      "title" : "Maleficent: Mistress of Evil",
      "genres" : [],
      "vote_count" : 811,
      "id" : 420809,
      "overview" : "Maleficent and her goddaughter Aurora begin to question the complex family ties that bind them as they are pulled in different directions by impending nuptials, unexpected allies, and dark new forces at play."
    },
    {
      "vote_count" : 268,
      "original_title" : "Dora and the Lost City of Gold",
      "id" : 499701,
      "genres" : [],
      "adult" : false,
      "backdrop_path" : "/61sbyO47yIpsMFyLhY1MWcqjg1Q.jpg",
      "vote_average" : 6.5,
      "title" : "Dora and the Lost City of Gold",
      "original_language" : "en",
      "video" : false,
      "release_date" : "2019-08-08",
      "overview" : "Dora, a girl who has spent most of her life exploring the jungle with her parents, now must navigate her most dangerous adventure yet: high school. Always the explorer, Dora quickly finds herself leading Boots (her best friend, a monkey), Diego, and a rag tag group of teens on an adventure to save her parents and solve the impossible mystery behind a lost Inca civilization.",
      "poster_path" : "/xvYCZ740XvngXK0FNeSNVTJJJ5v.jpg",
      "popularity" : 119.524
    },
    {
      "popularity" : 137.61000000000001,
      "adult" : false,
      "poster_path" : "/qdfARIhgpgZOBh3vfNhWS4hmSo3.jpg",
      "release_date" : "2019-11-11",
      "title" : "Frozen II",
      "vote_average" : 7.0999999046325684,
      "vote_count" : 28,
      "overview" : "Elsa, Anna, Kristoff and Olaf are going far in the forest to know the truth about an ancient mystery of their kingdom.",
      "backdrop_path" : "/xJWPZIYOEFIjZpBL7SVBGnzRYXp.jpg",
      "genres" : [],
      "original_title" : "Frozen II",
      "id" : 330457,
      "original_language" : "en",
      "video" : false
    },
    {
      "video" : false,
      "poster_path" : "/kvpNZAQow5es1tSY6XW2jAZuPPG.jpg",
      "original_title" : "Fast & Furious Presents: Hobbs & Shaw",
      "genres" : [],
      "id" : 384018,
      "original_language" : "en",
      "backdrop_path" : "/qAhedRxRYWZAgZ8O8pHIl6QHdD7.jpg",
      "adult" : false,
      "title" : "Fast & Furious Presents: Hobbs & Shaw",
      "vote_count" : 1847,
      "popularity" : 135.80799999999999,
      "release_date" : "2019-08-01",
      "vote_average" : 6.5,
      "overview" : "Ever since US Diplomatic Security Service Agent Hobbs and lawless outcast Shaw first faced off, they just have swapped smacks and bad words. But when cyber-genetically enhanced anarchist Brixton's ruthless actions threaten the future of humanity, both join forces to defeat him. (A spin-off of “The Fate of the Furious,” focusing on Johnson's Luke Hobbs and Statham's Deckard Shaw.)"
    },
    {
      "title" : "Spider-Man: Far from Home",
      "adult" : false,
      "original_title" : "Spider-Man: Far from Home",
      "backdrop_path" : "/5myQbDzw3l8K9yofUXRJ4UTVgam.jpg",
      "original_language" : "en",
      "video" : false,
      "popularity" : 102.45699999999999,
      "overview" : "Peter Parker and his friends go on a summer trip to Europe. However, they will hardly be able to rest - Peter will have to agree to help Nick Fury uncover the mystery of creatures that cause natural disasters and destruction throughout the continent.",
      "vote_average" : 7.5999999046325684,
      "release_date" : "2019-06-28",
      "id" : 429617,
      "vote_count" : 4955,
      "genres" : [],
      "poster_path" : "/lcq8dVxeeOqHvvgcte707K0KVx5.jpg"
    },
    {
      "original_language" : "en",
      "poster_path" : "/p69QzIBbN06aTYqRRiCOY1emNBh.jpg",
      "vote_average" : 7.0999999046325684,
      "original_title" : "Doctor Sleep",
      "overview" : "A traumatized, alcoholic Dan Torrance meets Abra, a kid who also has the ability to \"shine.\" He tries to protect her from the True Knot, a cult whose goal is to feed off of people like them in order to remain immortal.",
      "release_date" : "2019-10-30",
      "genres" : [],
      "vote_count" : 312,
      "video" : false,
      "adult" : false,
      "backdrop_path" : "/1nm0sk8UUx9jHCTHuMKe2jkt4Pn.jpg",
      "id" : 501170,
      "title" : "Doctor Sleep",
      "popularity" : 109.077
    },
    {
      "vote_average" : 7.0999999046325684,
      "backdrop_path" : "/rVqY0Bo4Npf6EIONUROxjYAJfmD.jpg",
      "popularity" : 90.602000000000004,
      "title" : "Aladdin",
      "genres" : [],
      "release_date" : "2019-05-22",
      "adult" : false,
      "poster_path" : "/3iYQTLGoy7QnjcUYRJy4YrAgGvp.jpg",
      "vote_count" : 4046,
      "overview" : "A kindhearted street urchin named Aladdin embarks on a magical adventure after finding a lamp that releases a wisecracking genie while a power-hungry Grand Vizier vies for the same lamp that has the power to make their deepest wishes come true.",
      "original_title" : "Aladdin",
      "original_language" : "en",
      "id" : 420817,
      "video" : false
    },
    {
      "vote_average" : 5.9000000953674316,
      "release_date" : "2019-07-25",
      "overview" : "Princes who have been turned into Dwarfs seek the red shoes of a lady in order to break the spell, although it will not be easy.",
      "title" : "Red Shoes and the Seven Dwarfs",
      "backdrop_path" : "/bga3i5jcejBekr2FCGJga1fYCh.jpg",
      "id" : 486589,
      "adult" : false,
      "poster_path" : "/MBiKqTsouYqAACLYNDadsjhhC0.jpg",
      "popularity" : 92.474000000000004,
      "vote_count" : 41,
      "original_language" : "en",
      "video" : false,
      "original_title" : "Red Shoes and the Seven Dwarfs",
      "genres" : []
    },
    {
      "release_date" : "2019-06-05",
      "vote_average" : 6.0999999046325684,
      "backdrop_path" : "/cjRUhKyt2Jo3V1KNzc5tpPNfccG.jpg",
      "id" : 320288,
      "poster_path" : "/cCTJPelKGLhALq3r51A9uMonxKj.jpg",
      "video" : false,
      "title" : "Dark Phoenix",
      "genres" : [],
      "popularity" : 97.238,
      "original_language" : "en",
      "vote_count" : 2412,
      "adult" : false,
      "original_title" : "Dark Phoenix",
      "overview" : "The X-Men face their most formidable and powerful foe when one of their own, Jean Grey, starts to spiral out of control. During a rescue mission in outer space, Jean is nearly killed when she's hit by a mysterious cosmic force. Once she returns home, this force not only makes her infinitely more powerful, but far more unstable. The X-Men must now band together to save her soul and battle aliens that want to use Grey's new abilities to rule the galaxy."
    },
    {
      "adult" : false,
      "backdrop_path" : "/bOGkgRGdhrBYJSLpXaxhXVstddV.jpg",
      "genres" : [],
      "overview" : "As the Avengers and their allies have continued to protect the world from threats too large for any one hero to handle, a new danger has emerged from the cosmic shadows: Thanos. A despot of intergalactic infamy, his goal is to collect all six Infinity Stones, artifacts of unimaginable power, and use them to inflict his twisted will on all of reality. Everything the Avengers have fought for has led up to this moment - the fate of Earth and existence itself has never been more uncertain.",
      "poster_path" : "/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg",
      "vote_count" : 15756,
      "original_language" : "en",
      "original_title" : "Avengers: Infinity War",
      "popularity" : 83.492000000000004,
      "id" : 299536,
      "video" : false,
      "vote_average" : 8.3000001907348633,
      "release_date" : "2018-04-25",
      "title" : "Avengers: Infinity War"
    },
    {
      "poster_path" : "/ePXuKdXZuJx8hHMNr2yM4jY2L7Z.jpg",
      "original_title" : "El Camino: A Breaking Bad Movie",
      "overview" : "In the wake of his dramatic escape from captivity, Jesse Pinkman must come to terms with his past in order to forge some kind of future.",
      "vote_average" : 7.0999999046325684,
      "backdrop_path" : "/ijiE9WoGSwSzM16zTxvUneJ8RXc.jpg",
      "release_date" : "2019-10-11",
      "genres" : [],
      "original_language" : "en",
      "vote_count" : 1380,
      "popularity" : 77.471999999999994,
      "title" : "El Camino: A Breaking Bad Movie",
      "video" : false,
      "adult" : false,
      "id" : 559969
    },
    {
      "video" : false,
      "original_title" : "The King",
      "genres" : [],
      "poster_path" : "/8u0QBGUbZcBW59VEAdmeFl9g98N.jpg",
      "backdrop_path" : "/oMAhce30UvkgJwlzMwsuLaPJ5cG.jpg",
      "adult" : false,
      "id" : 504949,
      "release_date" : "2019-10-11",
      "vote_count" : 434,
      "title" : "The King",
      "vote_average" : 7.1999998092651367,
      "original_language" : "en",
      "overview" : "England, 15th century. Hal, a capricious prince who lives among the populace far from court, is forced by circumstances to reluctantly accept the throne and become Henry V.",
      "popularity" : 77.311999999999998
    },
    {
      "overview" : "A group of backpackers diving in a ruined underwater city discover that they have stumbled into the territory of the ocean's deadliest shark species.",
      "release_date" : "2019-08-15",
      "poster_path" : "/g4z7mDmJmx23vsVg6XNWcnXb6gc.jpg",
      "backdrop_path" : "/3uG3aOhEzFCjcQulsJQiAzLSrw8.jpg",
      "vote_average" : 5,
      "title" : "47 Meters Down: Uncaged",
      "original_title" : "47 Meters Down: Uncaged",
      "adult" : false,
      "id" : 480105,
      "original_language" : "en",
      "popularity" : 69.025000000000006,
      "video" : false,
      "genres" : [],
      "vote_count" : 197
    },
    {
      "original_title" : "Let It Snow",
      "title" : "Let It Snow",
      "popularity" : 74.230000000000004,
      "vote_count" : 142,
      "original_language" : "en",
      "genres" : [],
      "overview" : "When a huge blizzard (that doesn't show signs of stopping) hits, Gracetown is completely snowed in. But even though it's cold outside, things are heating up inside, proving that Christmas is magical when it comes to love.",
      "id" : 295151,
      "release_date" : "2019-11-08",
      "poster_path" : "/rEVu3E1OhMPJeCAn9a6QLyVhZDj.jpg",
      "adult" : false,
      "vote_average" : 6.4000000953674316,
      "backdrop_path" : "/4oSRQ03nJjl8sZAPgIXgi51XZva.jpg",
      "video" : false
    },
    {
      "video" : false,
      "poster_path" : "/pIcV8XXIIvJCbtPoxF9qHMKdRr2.jpg",
      "adult" : false,
      "vote_average" : 7.3000001907348633,
      "genres" : [],
      "vote_count" : 346,
      "title" : "Zombieland: Double Tap",
      "release_date" : "2019-10-09",
      "id" : 338967,
      "popularity" : 71.643000000000001,
      "original_title" : "Zombieland: Double Tap",
      "overview" : "Columbus, Tallahassee, Wichita, and Little Rock move to the American heartland as they face off against evolved zombies, fellow survivors, and the growing pains of the snarky makeshift family.",
      "backdrop_path" : "/jCCdt0e8Xe9ttvevD4S3TSMNdH.jpg",
      "original_language" : "en"
    }
  ],
  "page" : 1,
  "total_pages" : 500,
  "total_results" : 10000
}


"""

let mockMovieDetailResponse = """

{
  "original_title" : "Cars",
  "release_date" : "2006-06-08",
  "poster_path" : "/jpfkzbIXgKZqCZAkEkFH2VYF63s.jpg",
  "original_language" : "en",
  "genres" : [
    {
      "id" : 16,
      "name" : "Animation"
    },
    {
      "id" : 12,
      "name" : "Adventure"
    },
    {
      "name" : "Comedy",
      "id" : 35
    },
    {
      "name" : "Family",
      "id" : 10751
    }
  ],
  "vote_count" : 8330,
  "vote_average" : 6.6999998092651367,
  "popularity" : 127.498,
  "id" : 920,
  "title" : "Cars",
  "backdrop_path" : "/a1MlbLBk5Sy6YvMbSuKfwGlDVlb.jpg",
  "overview" : "Lightning McQueen, a hotshot rookie race car driven to succeed, discovers that life is about the journey, not the finish line, when he finds himself unexpectedly detoured in the sleepy Route 66 town of Radiator Springs. On route across the country to the big Piston Cup Championship in California to compete against two seasoned pros, McQueen gets to know the town's offbeat characters.",
  "video" : false,
  "adult" : false
}


"""
