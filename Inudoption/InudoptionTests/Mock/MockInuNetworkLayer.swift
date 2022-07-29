//
//  MockInuNetworkLayer.swift
//  InudoptionTests
//
//  Created by Daniel Moreno on 7/28/22.
//

import Foundation
import Combine
@testable import Inudoption

class MockInuNetworkLayer: InuNetworkClient {
    func friendsFromInudoption(friendCount: Int) -> AnyPublisher<[Friend], Error> {
        let friends = FriendGenerator.createFriends(friendCount: friendCount)
        let publisher = CurrentValueSubject<[Friend], Error>(friends)
        return publisher.eraseToAnyPublisher()
    }
}
