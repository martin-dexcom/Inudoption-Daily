//
//  InudoptionTests.swift
//  InudoptionTests
//
//  Created by Daniel Moreno on 7/28/22.
//

import XCTest
import Combine
@testable import Inudoption

class InudoptionTests: XCTestCase {

    var mainScreenViewModel = MainScreenViewModel(inuNetworkLayer: MockInuNetworkLayer())
    var subscriber: AnyCancellable?

    override func setUpWithError() throws {
        mainScreenViewModel = MainScreenViewModel(inuNetworkLayer: MockInuNetworkLayer())
    }

    func testGetTenFriendsThenViewModelFriendsEqualsTen() {
        let expection = expectation(description: "Friend count equals 10")
        mainScreenViewModel.getFriends(friendCount: 12)
        subscriber = mainScreenViewModel.$friends.sink { friends in
            if friends.count != 0 {
                XCTAssertEqual(friends.count, 12)
                expection.fulfill()
            }
        }
        waitForExpectations(timeout: 5)
    }

    func testMatchFriend() {
        mainScreenViewModel.friends = FriendGenerator.createFriends(friendCount: 10)
        let friend = mainScreenViewModel.match()
        XCTAssertNotNil(friend)
        XCTAssertEqual(mainScreenViewModel.friends.count, 9)
        XCTAssertEqual(mainScreenViewModel.matchedFriends.count, 1)
        let matchFriend = mainScreenViewModel.matchedFriends[0]
        XCTAssertEqual(friend?.id, matchFriend.id)
    }

    func testDiscardFriend() {
        mainScreenViewModel.friends = FriendGenerator.createFriends(friendCount: 10)
        let discardFriend = mainScreenViewModel.friends.last


        mainScreenViewModel.discard()

        let lastFriend = mainScreenViewModel.friends.last
        XCTAssertNotNil(discardFriend)
        XCTAssertNotNil(lastFriend)
        XCTAssertTrue(lastFriend?.id != discardFriend?.id)
    }
}
