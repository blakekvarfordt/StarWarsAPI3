//
//  Starship.swift
//  StarWarsAPI3
//
//  Created by Blake kvarfordt on 10/3/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import Foundation

struct TopLevelDict: Decodable {
    let results: [Starship]
}

struct Starship: Decodable {
    let name: String
    let model: String
    let cost: String
    let speed: String
    let films: [String]
    
    enum CodingKeys: String, CodingKey {
        case name
        case model
        case cost = "cost_in_credits"
        case speed = "max_atmosphering_speed"
        case films
    }
    
}
