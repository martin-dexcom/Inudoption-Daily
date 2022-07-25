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
                ReusableTitle(topTitle: "Adopt a", bottomTitle: "Best Friend")
                Spacer()
            }
            friendsView
            ZStack {
                ForEach($viewModel.friends) { friend in
                    Card(friend: friend.wrappedValue)
                        .onTapGesture {
                            viewModel.filterFriends(with: friend.id)
                        }
                }
            }
            HStack(spacing: 8) {
                InuButton(action: {
                    print("Discard")
                }, type: .discard)
                InuButton(action: {
                    print("Match")
                }, type: .match)
            }
        }
        .padding(.horizontal, 17)
        .padding(.vertical, 28)
    }
    
    var friendsView: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(0..<11) { number in
                    Text("Friend \(number)")
                }
                .frame(width: 105, height: 70, alignment: .center)
                .background(Color.inuTertiary)
            }
        }
    }
}
