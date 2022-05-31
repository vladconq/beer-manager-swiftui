//
//  Beer.swift
//  BeerManagerSwiftUI
//
//  Created by mainuser on 30.05.2022.
//

import Foundation

struct Beer: Identifiable, Codable, Equatable {
    let id: Int
    let targetFg: Int?
    let ph, ebc, srm, ibu, abv, targetOg, attenuationLevel: Double?
    let name, tagline, firstBrewed, welcomeDescription, brewersTips, contributedBy: String
    let imageURL: String?
    let foodPairing: [String]
    
    enum CodingKeys: String, CodingKey {
        case id, name, tagline
        case firstBrewed = "first_brewed"
        case welcomeDescription = "description"
        case imageURL = "image_url"
        case abv, ibu
        case targetFg = "target_fg"
        case targetOg = "target_og"
        case ebc, srm, ph
        case attenuationLevel = "attenuation_level"
        case foodPairing = "food_pairing"
        case brewersTips = "brewers_tips"
        case contributedBy = "contributed_by"
    }
}

