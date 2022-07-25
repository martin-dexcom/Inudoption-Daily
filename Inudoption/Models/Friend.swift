//
//  Friend.swift
//  Inudoption
//
//  Created by Daniel Moreno on 7/21/22.
//

import Foundation

// MARK: - Friend
struct Friend: Codable, Identifiable, Verifiable {
    var id = UUID().uuidString
    let name: String
    let image: String
    let animal: Animal
    let fact, dateOfBirth: String
    var isVerified: Bool = Bool.random()
    
    mutating func verify() {
        isVerified = true
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case image
        case animal
        case fact
        case dateOfBirth
    }
}
