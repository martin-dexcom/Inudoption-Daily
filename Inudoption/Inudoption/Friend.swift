//
//  Friend.swift
//  Inudoption
//
//  Created by Daniel Moreno on 7/21/22.
//

import Foundation

// MARK: - Friend
struct Friend: Codable, Identifiable {
    var id = UUID().uuidString
    let name: String
    let image: String
    let animal: Animal
    let fact, dateOfBirth: String

    enum CodingKeys: String, CodingKey {
        case name
        case image
        case animal
        case fact
        case dateOfBirth
    }
}

enum Animal: String, Codable {
    case bird = "Bird"
    case cat = "Cat"
    case dog = "Dog"
}
