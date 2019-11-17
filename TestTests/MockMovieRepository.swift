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
    func getPopular<T>(page: Int, completion: @escaping (Pageable<T>?, Error?) -> Void) -> Void where T : Mappable, T : MovieModelProtocol {
        if page > 0, page <= mockPopularResponse.count {
            let mappedMovieList = Pageable<T>(JSONString: mockPopularResponse[page-1])
            completion(mappedMovieList,nil)
        }
        else{
            let userInfo: [String : Any] =
            [
                NSLocalizedDescriptionKey :  "Unable to process request",
                NSLocalizedFailureReasonErrorKey : "Invalid Request"
            ]
            let error = NSError(domain: "ZI.Test", code: 400, userInfo: userInfo)
            completion(nil, error)
        }
    }
    
    func getMovie<T>(id: Int, completion: @escaping (T?, Error?) -> Void) -> Void where T : Mappable, T : MovieModelProtocol {
        if id == 920 {
            let details = T(JSONString: mockMovieDetailResponse)
            completion(details,nil)
        }
        else{
            let userInfo: [String : Any] =
            [
                NSLocalizedDescriptionKey :  "Unable to process request",
                NSLocalizedFailureReasonErrorKey : "Invalid Request"
            ]
            let error = NSError(domain: "ZI.Test", code: 400, userInfo: userInfo)
            completion(nil, error)
        }
    }
    
    func getVideos(id: Int, completion: @escaping (VideoResponse?, Error?) -> Void) -> Void {
        if id == 920 {
            let videos = VideoResponse(JSONString: videosResponse)
            completion(videos,nil)
        }
        else{
            let userInfo: [String : Any] =
            [
                NSLocalizedDescriptionKey :  "Unable to process request",
                NSLocalizedFailureReasonErrorKey : "Invalid Request"
            ]
            let error = NSError(domain: "ZI.Test", code: 400, userInfo: userInfo)
            completion(nil, error)
        }
    }
    
    
}



let mockPopularResponse:[String] = ["""
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
      "overview" : "A traumatized, alcoholic Dan Torrance meets Abra, a kid who also has the ability to 'shine.' He tries to protect her from the True Knot, a cult whose goal is to feed off of people like them in order to remain immortal.",
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
""",
"""
{
  "results": [
    {
      "original_language": "en",
      "vote_count": 1415,
      "original_title": "El Camino: A Breaking Bad Movie",
      "video": false,
      "vote_average": 7,
      "overview": "In the wake of his dramatic escape from captivity, Jesse Pinkman must come to terms with his past in order to forge some kind of future.",
      "genres": [],
      "id": 559969,
      "backdrop_path": "/ijiE9WoGSwSzM16zTxvUneJ8RXc.jpg",
      "release_date": "2019-10-11",
      "adult": false,
      "popularity": 80.907,
      "title": "El Camino: A Breaking Bad Movie",
      "poster_path": "/ePXuKdXZuJx8hHMNr2yM4jY2L7Z.jpg"
    },
    {
      "genres": [],
      "vote_average": 8,
      "popularity": 75.585,
      "title": "Ford v Ferrari",
      "release_date": "2019-10-10",
      "id": 359724,
      "backdrop_path": "/n3UanIvmnBlH531pykuzNs4LbH6.jpg",
      "original_language": "en",
      "overview": "American car designer Carroll Shelby and the British-born driver Ken Miles work together to battle corporate interference, the laws of physics, and their own personal demons to build a revolutionary race car for Ford Motor Company and take on the dominating race cars of Enzo Ferrari at the 24 Hours of Le Mans in France in 1966.",
      "video": false,
      "original_title": "Ford v Ferrari",
      "adult": false,
      "poster_path": "/6ApDtO7xaWAfPqfi2IARXIzj8QS.jpg",
      "vote_count": 64
    },
    {
      "original_language": "en",
      "backdrop_path": "/1ZSjrBUHP2jm1QlQEyLGufL289q.jpg",
      "genres": [],
      "original_title": "Midway",
      "title": "Midway",
      "adult": false,
      "poster_path": "/xL1yNzwGSXfassYpt13hXADpz6R.jpg",
      "vote_count": 64,
      "popularity": 61.411,
      "overview": "The story of the soldiers and aviators who helped turn the tide of the Second World War during the iconic Battle of Midway in June 1942.",
      "release_date": "2019-11-06",
      "id": 522162,
      "vote_average": 6,
      "video": false
    },
    {
      "release_date": "2019-08-02",
      "vote_count": 286,
      "overview": "Red, Chuck, Bomb and the rest of their feathered friends are surprised when a green pig suggests that they put aside their differences and unite to fight a common threat. Aggressive birds from an island covered in ice are planning to use an elaborate weapon to destroy the fowl and swine.",
      "poster_path": "/ebe8hJRCwdflNQbUjRrfmqtUiNi.jpg",
      "popularity": 69.76,
      "vote_average": 6.5,
      "original_language": "en",
      "title": "The Angry Birds Movie 2",
      "video": false,
      "id": 454640,
      "original_title": "The Angry Birds Movie 2",
      "adult": false,
      "backdrop_path": "/k7sE3loFwuU2mqf7FbZBeE3rjBa.jpg",
      "genres": []
    },
    {
      "adult": false,
      "overview": "Following his defeat by Master Ip, Cheung Tin Chi (Zhang) tries to make a life with his young son in Hong Kong, waiting tables at a bar that caters to expats. But it s not long before the mix of foreigners, money, and triad leaders draw him once again to the fight.",
      "original_title": "葉問外傳：張天志",
      "genres": [],
      "popularity": 43.969,
      "video": false,
      "id": 450001,
      "release_date": "2018-12-20",
      "title": "Master Z: Ip Man Legacy",
      "poster_path": "/6VxEvOF7QDovsG6ro9OVyjH07LF.jpg",
      "original_language": "cn",
      "vote_count": 192,
      "backdrop_path": "/grtVFGJ4ts0nDAPpc1JWbBoVKTu.jpg",
      "vote_average": 5.400000095367432
    },
    {
      "vote_average": 6.5,
      "backdrop_path": "/6Xsz9KHQmCcIcj3CoWQq5eLtVoT.jpg",
      "release_date": "2019-08-14",
      "popularity": 62.246,
      "overview": "A group of young boys on the cusp of becoming teenagers embark on an epic quest to fix their broken drone before their parents get home.",
      "genres": [],
      "original_language": "en",
      "adult": false,
      "original_title": "Good Boys",
      "poster_path": "/tximyCXMEnWIIyOy9STkOduUprG.jpg",
      "video": false,
      "vote_count": 380,
      "id": 521777,
      "title": "Good Boys"
    },
    {
      "overview": "Kris Kringle's daughter, Noelle, sets off on a mission to find and bring back her brother, after he gets cold feet when it's his turn to take over as Santa.",
      "original_title": "Noelle",
      "poster_path": "/ljxeeVQJra8O4slFsmmnf5NgFx4.jpg",
      "title": "Noelle",
      "backdrop_path": "/dVM0ZSzbMbz7b0LxrNRz1gdhcGM.jpg",
      "original_language": "en",
      "adult": false,
      "vote_average": 7.5,
      "release_date": "2019-11-12",
      "genres": [],
      "id": 454467,
      "popularity": 63.594,
      "vote_count": 12,
      "video": false
    },
    {
      "popularity": 65.733,
      "overview": "Columbus, Tallahassee, Wichita, and Little Rock move to the American heartland as they face off against evolved zombies, fellow survivors, and the growing pains of the snarky makeshift family.",
      "original_title": "Zombieland: Double Tap",
      "genres": [],
      "release_date": "2019-10-09",
      "backdrop_path": "/jCCdt0e8Xe9ttvevD4S3TSMNdH.jpg",
      "title": "Zombieland: Double Tap",
      "vote_count": 398,
      "vote_average": 7.400000095367432,
      "poster_path": "/pIcV8XXIIvJCbtPoxF9qHMKdRr2.jpg",
      "video": false,
      "id": 338967,
      "original_language": "en",
      "adult": false
    },
    {
      "adult": false,
      "genres": [],
      "overview": "All unemployed, Ki-taek's family takes peculiar interest in the wealthy and glamorous Parks for their livelihood until they get entangled in an unexpected incident.",
      "release_date": "2019-05-30",
      "poster_path": "/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg",
      "title": "Parasite",
      "vote_average": 8.5,
      "original_language": "ko",
      "id": 496243,
      "original_title": "기생충",
      "video": false,
      "popularity": 64.63,
      "vote_count": 1240,
      "backdrop_path": "/TU9NIjwzjoKPwQHoHshkFcQUCG.jpg"
    },
    {
      "video": false,
      "adult": false,
      "original_title": "John Wick: Chapter 3 - Parabellum",
      "popularity": 64.098,
      "title": "John Wick: Chapter 3 - Parabellum",
      "genres": [],
      "overview": "Super-assassin John Wick returns with a $14 million price tag on his head and an army of bounty-hunting killers on his trail. After killing a member of the shadowy international assassin’s guild, the High Table, John Wick is excommunicado, but the world’s most ruthless hit men and women await his every turn.",
      "original_language": "en",
      "id": 458156,
      "vote_average": 7.099999904632568,
      "vote_count": 3188,
      "poster_path": "/ziEuG1essDuWuC5lpWUaw1uXY2O.jpg",
      "backdrop_path": "/stemLQMLDrlpfIlZ5OjllOPT8QX.jpg",
      "release_date": "2019-05-15"
    },
    {
      "overview": "Multiple coincidences and a chance meeting bring together Alice and Jack, two strangers from very different family backgrounds, for an unexpected Christmastime courtship filled with personal revelations, misread signals, and a very real health scare that will either destroy or strengthen the budding romance.",
      "genres": [],
      "original_title": "A Godwink Christmas: Meant For Love",
      "vote_count": 0,
      "backdrop_path": "/xTWIt1f6ux3VnA1WVBqZntIkqQq.jpg",
      "video": false,
      "vote_average": 0,
      "poster_path": "/qSAlA5PlKUGmn4S3sNszZ4iXFuM.jpg",
      "adult": false,
      "original_language": "en",
      "id": 630900,
      "release_date": "2019-11-15",
      "popularity": 62.736,
      "title": "A Godwink Christmas: Meant For Love"
    },
    {
      "popularity": 49.563,
      "genres": [],
      "video": false,
      "release_date": "2014-10-22",
      "id": 245891,
      "poster_path": "/5vHssUeVe25bMrof1HyaPyWgaP.jpg",
      "vote_count": 11184,
      "original_title": "John Wick",
      "adult": false,
      "vote_average": 7.199999809265137,
      "backdrop_path": "/iJlGxN0p1suzloBGvvBu3QSSlhT.jpg",
      "overview": "Ex-hitman John Wick comes out of retirement to track down the gangsters that took everything from him.",
      "title": "John Wick",
      "original_language": "en"
    },
    {
      "video": false,
      "adult": false,
      "popularity": 44.237,
      "genres": [],
      "original_title": "Harry Potter and the Philosopher's Stone",
      "original_language": "en",
      "backdrop_path": "/hziiv14OpD73u9gAak4XDDfBKa2.jpg",
      "vote_average": 7.800000190734863,
      "poster_path": "/dCtFvscYcXQKTNvyyaQr2g2UacJ.jpg",
      "release_date": "2001-11-16",
      "title": "Harry Potter and the Philosopher's Stone",
      "overview": "Harry Potter has lived under the stairs at his aunt and uncle's house his whole life. But on his 11th birthday, he learns he's a powerful wizard -- with a place waiting for him at the Hogwarts School of Witchcraft and Wizardry. As he learns to harness his newfound powers with the help of the school's kindly headmaster, Harry uncovers the truth about his parents' deaths -- and about the villain who's to blame.",
      "id": 671,
      "vote_count": 15055
    },
    {
      "release_date": "2019-10-11",
      "id": 504949,
      "overview": "England, 15th century. Hal, a capricious prince who lives among the populace far from court, is forced by circumstances to reluctantly accept the throne and become Henry V.",
      "genres": [],
      "popularity": 55.535,
      "poster_path": "/8u0QBGUbZcBW59VEAdmeFl9g98N.jpg",
      "original_title": "The King",
      "original_language": "en",
      "backdrop_path": "/r0AWsZ9dBvC2No3kND9nxv3iRbb.jpg",
      "adult": false,
      "vote_count": 467,
      "vote_average": 7.199999809265137,
      "title": "The King",
      "video": false
    },
    {
      "vote_average": 6.400000095367432,
      "backdrop_path": "/pIL9e5cN6RNugDCCLwn3stfb9HE.jpg",
      "id": 484641,
      "title": "Anna",
      "original_language": "fr",
      "popularity": 57.654,
      "video": false,
      "vote_count": 583,
      "adult": false,
      "release_date": "2019-06-19",
      "original_title": "Anna",
      "genres": [],
      "poster_path": "/d8u4jpkDKgEPDJUl4g3vOOP3mDe.jpg",
      "overview": "Beneath Anna Poliatova's striking beauty lies a secret that will unleash her indelible strength and skill to become one of the world's most feared government assassins."
    },
    {
      "original_title": "Cars",
      "poster_path": "/jpfkzbIXgKZqCZAkEkFH2VYF63s.jpg",
      "adult": false,
      "title": "Cars",
      "release_date": "2006-06-08",
      "genres": [],
      "backdrop_path": "/a1MlbLBk5Sy6YvMbSuKfwGlDVlb.jpg",
      "overview": "Lightning McQueen, a hotshot rookie race car driven to succeed, discovers that life is about the journey, not the finish line, when he finds himself unexpectedly detoured in the sleepy Route 66 town of Radiator Springs. On route across the country to the big Piston Cup Championship in California to compete against two seasoned pros, McQueen gets to know the town's offbeat characters.",
      "popularity": 85.596,
      "original_language": "en",
      "vote_average": 6.699999809265137,
      "id": 920,
      "video": false,
      "vote_count": 8342
    },
    {
      "vote_average": 5.599999904632568,
      "popularity": 61.591,
      "video": false,
      "id": 101411,
      "adult": false,
      "original_title": "23-F: la película",
      "genres": [],
      "release_date": "2011-02-23",
      "title": "23-F: la película",
      "original_language": "es",
      "poster_path": "/fgw1XkdmSaD226KtIKcdNmysb3X.jpg",
      "overview": "The failed coup d'état of February 23, 1981, which began with the capture of the Congress of Deputies and ended with the release of parliamentarians, put at serious risk the Spanish democracy.",
      "backdrop_path": "/53mOHTuLtzlzGX7vw6ryQCU0gUC.jpg",
      "vote_count": 10
    },
    {
      "backdrop_path": "/8moTOzunF7p40oR5XhlDvJckOSW.jpg",
      "vote_average": 6.900000095367432,
      "video": false,
      "original_title": "It Chapter Two",
      "genres": [],
      "title": "It Chapter Two",
      "id": 474350,
      "popularity": 49.711,
      "vote_count": 1945,
      "release_date": "2019-09-04",
      "overview": "27 years after overcoming the malevolent supernatural entity Pennywise, the former members of the Losers' Club, who have grown up and moved away from Derry, are brought back together by a devastating phone call.",
      "original_language": "en",
      "adult": false,
      "poster_path": "/zfE0R94v1E8cuKAerbskfD3VfUt.jpg"
    },
    {
      "id": 122917,
      "vote_average": 7.300000190734863,
      "genres": [],
      "video": false,
      "popularity": 37.908,
      "adult": false,
      "backdrop_path": "/qhH3GyIfAnGv1pjdV3mw03qAilg.jpg",
      "release_date": "2014-12-10",
      "original_title": "The Hobbit: The Battle of the Five Armies",
      "title": "The Hobbit: The Battle of the Five Armies",
      "overview": "Immediately after the events of The Desolation of Smaug, Bilbo and the dwarves try to defend Erebor's mountain of treasure from others who claim it: the men of the ruined Laketown and the elves of Mirkwood. Meanwhile an army of Orcs led by Azog the Defiler is marching on Erebor, fueled by the rise of the dark lord Sauron. Dwarves, elves and men must unite, and the hope for Middle-Earth falls into Bilbo's hands.",
      "original_language": "en",
      "vote_count": 8940,
      "poster_path": "/9zRzFJuaj0CHIOhAkcCcFTvyu2X.jpg"
    },
    {
      "poster_path": "/ljAMsxYS3i8GlEoXAKZxaK88EAO.jpg",
      "vote_count": 2,
      "overview": "'Lupinranger VS Patranger VS Kyuranger' is an upcoming V-Cinext film between Kaitou Sentai Lupinranger VS Keisatsu Sentai Patranger and Uchu Sentai Kyuranger. The story begins when the Lupinrangers, Kairi, Touma, and Umika, are kidnapped by someone mysterious. The Patrangers are then tasked with an Abduction Case to find the missing thieves, where they run into the Kyuranger team as they pass through space. Just who exactly kidnapped them? And why did the 12 Kyurangers return to space?",
      "release_date": "2019-05-03",
      "original_language": "ja",
      "video": false,
      "vote_average": 5.5,
      "id": 566057,
      "popularity": 56.867,
      "title": "Lupinranger VS Patranger VS Kyuranger",
      "genres": [],
      "backdrop_path": "/uIAnWjl1PNsFL9M24KzVMmO6sdo.jpg",
      "original_title": "ルパンレンジャーＶＳパトレンジャーＶＳキュウレンジャー",
      "adult": false
    }
  ],
  "total_pages": 500,
  "total_results": 10000,
  "page": 2
}

"""
]

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

let videosResponse = """
{
  "results": [
    {
      "iso_639_1": "en",
      "type": "Trailer",
      "site": "YouTube",
      "id": "590c8ba29251415a8b00e775",
      "name": "Official Trailer: Cars (2006)",
      "size": 360,
      "iso_3166_1": "US",
      "key": "SbXIj2T-_uk"
    }
  ],
  "id": 920
}
"""
