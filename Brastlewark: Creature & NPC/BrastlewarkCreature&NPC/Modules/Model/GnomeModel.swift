//
//  GnomeModel.swift
//  Brastlewark: Creature & NPC
//
//  Created by  Jose  Santiago on 5/20/20.
//  Copyright © 2020  Jose  Santiago. All rights reserved.
//

import Foundation

struct Population: Codable {
    let Brastlewark: [Gnome]
    
    enum CodingKeys: String, CodingKey {
        case Brastlewark = "Brastlewark"
    }
}

struct Gnome: Codable {
    let id: Int?
    let name: String?
    let thumbnail: String?
    let age: Int?
    let weight: Double?
    let height: Double?
    let hair_color: String?
    let professions: [String]?
    let friends: [String]?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case thumbnail = "thumbnail"
        case age = "age"
        case weight = "weight"
        case height = "height"
        case hair_color = "hair_color"
        case professions = "professions"
        case friends = "friends"
    }

}
