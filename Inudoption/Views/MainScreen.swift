//
//  MainScreen.swift
//  Inudoption
//
//  Created by Daniel Moreno on 7/19/22.
//

import SwiftUI

struct MainScreen: View {
    @ObservedObject var viewModel = MainScreenViewModel(inuNetworkLayer: InuNetworkLayer())
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                ReusableTitle(topTitle: "adopt",
                              bottomTitle: LocalizedStringKey("bestFriend"))
                Spacer()
            }
            friendsView
            Spacer()
            ZStack {
                ForEach($viewModel.friends.filter(viewModel.filterExpressionForDummies)) { friend in
                    VStack {
                        NavigationLink {
                            DetailView(friend: friend.wrappedValue,
                                       isAlreadyMatched: false, matchAction: {
                                _ = viewModel.match()
                            }, discardAction: {
                                viewModel.discard()
                            })
                        } label: {
                            Card(friend: friend.wrappedValue)
                        }
                    }
                }
            }
            HStack(spacing: 8) {
                InuButton(action: {
                    viewModel.discard()
                }, type: .discard)
                InuButton(action: {
                    if let friend = viewModel.match() {
                        let subtitle = "You matched with \(friend.name)"
                        NotificationManager.shared.showNotification(title: "Say hello to your new friend", subtitle: subtitle)
                    }
                }, type: .match)
            }
        }
        .padding(.horizontal, 17)
        .padding(.vertical, 28)
        .onAppear {
            viewModel.getFriends(friendCount: 10)
            NotificationManager.shared.requestNotificationPermission()
        }
    }
    // We wrapped this view on a nav. view
    // that means that we can now move to other screens with user interaction
    
    // Homework:
    // - How do we remove the coloring from this link?
    // - How do we make sure these tabs are the correct size within a column?
    // How do I remove the large spacing?
    var friendsView: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach($viewModel.matchedFriends) { friend in
                    NavigationLink {
                        DetailView(friend: friend.wrappedValue,
                                   isAlreadyMatched: true,
                                   matchAction: { },
                                   discardAction: { })
                    } label: {
                        MatchedFriendView(friend: friend.wrappedValue)
                    }
                }
            }
        }
    }
}
