//
//  MainScreenViewModel.swift
//  Inudoption
//
//  Created by Daniel Moreno on 7/21/22.
//

import Foundation
import Combine

class MainScreenViewModel: ObservableObject {
    
    var subscription: AnyCancellable?
    
    @Published var friends = [Friend]()
    @Published var matchedFriends = [Friend]()
    
    func filterFriends(with id: String) {
        friends = friends.filter { $0.id != id }
    }
    
    init() {
        getFriends()
    }
    
    func getFriends() {
        subscription = InuNetworkLayer.shared.friendsFromInudoption(friendCount: 10)
            .receive(on: RunLoop.main)
            .sink { error in
                if case .failure(let error) = error {
                    print(error)
                }
            } receiveValue: { friends in
                self.friends = friends
            }
    }
    
    func match() {
        if let lastFriend = friends.last {
            friends.removeAll(where: { $0.id == lastFriend.id })
            matchedFriends.append(lastFriend)
        }
    }
    
    func discard() {
        if let lastFriend = friends.last {
            friends.removeAll(where: { $0.id == lastFriend.id })
        }
    }
}
