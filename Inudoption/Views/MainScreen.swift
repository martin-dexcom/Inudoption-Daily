//
//  MainScreen.swift
//  Inudoption
//
//  Created by Daniel Moreno on 7/19/22.
//

import SwiftUI

struct MainScreen: View {
    @ObservedObject var viewModel = MainScreenViewModel()
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                ReusableTitle(topTitle: "adopt",
                              bottomTitle: LocalizedStringKey("bestFriend"))
                Spacer()
            }
            friendsView
            ZStack {
                ForEach($viewModel.friends) { friend in
                    VStack {
                        NavigationLink {
                            DetailView(friend: friend.wrappedValue,
                                       isAlreadyMatched: false, matchAction: {
                                viewModel.match()
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
                    viewModel.match()
                }, type: .match)
            }
        }
        .padding(.horizontal, 17)
        .padding(.vertical, 28)
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
