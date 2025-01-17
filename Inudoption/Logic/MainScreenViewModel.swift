//
//  MainScreenViewModel.swift
//  Inudoption
//
//  Created by Daniel Moreno on 7/21/22.
//

import Foundation
import Combine
import SwiftUI

class MainScreenViewModel: ObservableObject {
    
    var subscription: AnyCancellable?
    let inuNetworkLayer: InuNetworkClient
    
    @AppStorage("preferredAnimal") var preferredAnimal: Animal = .dog
    
    @Published var friends = [Friend]()
    @Published var matchedFriends = [Friend]()
    
    var filterExpression: (Friend) -> Bool = { _ in true }
    var filterExpressionForDummies: ((Binding<Friend>) -> Bool) = { _ in true }
    
    init(inuNetworkLayer: InuNetworkClient) {
        self.inuNetworkLayer = inuNetworkLayer
        filterExpression = { [weak self] in $0.animal == self?.preferredAnimal }
        filterExpressionForDummies = { [weak self] in $0.wrappedValue.animal == self?.preferredAnimal }
    }
    
    func getFriends(friendCount: Int) {
        subscription = inuNetworkLayer.friendsFromInudoption(friendCount: friendCount)
            .receive(on: RunLoop.main)
            .sink { error in
                if case .failure(let error) = error {
                    print(error)
                }
            } receiveValue: { friends in
                self.friends = friends
            }
    }
    
    func match() -> Friend? {
        if let lastFriend = friends
            .filter(filterExpression)
            .last {
            friends.removeAll(where: { $0.id == lastFriend.id })
            matchedFriends.append(lastFriend)
            return lastFriend
        }
        return nil
    }
    
    func discard() {
        if let lastFriend = friends.filter(filterExpression).last {
            friends.removeAll(where: { $0.id == lastFriend.id })
        }
    }
}
