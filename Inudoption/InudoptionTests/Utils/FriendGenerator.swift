//
//  FriendGenerator.swift
//  InudoptionTests
//
//  Created by Daniel Moreno on 7/28/22.
//

import Foundation
@testable import Inudoption

class FriendGenerator {
    static func createFriends(friendCount: Int) -> [Friend] {
        var friends = [Friend]()
        for _ in 0..<friendCount {
           let friend = Friend(id: UUID().uuidString, name: "Random", image: "", animal: .dog, fact: "", dateOfBirth: "", isVerified: true)
            friends.append(friend)
        }
        return friends
    }
}
