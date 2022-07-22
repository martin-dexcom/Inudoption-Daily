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
        VStack {
            ReusableTitle(topTitle: "Adopt a", bottomTitle: "Best Friend")
            friendsView
            ZStack {
                ForEach($viewModel.friends) { friend in
                    adoptionView(friend: friend.wrappedValue)
                        .frame(minWidth: 0,
                               maxWidth: .infinity,
                               minHeight: 350,
                               maxHeight: .infinity)
                        .background(Color.red)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            viewModel.filterFriends(with: friend.id)
                        }
                }
            }
            Spacer()
        }
    }

    func adoptionView(friend: Friend) -> some View {
        ZStack(alignment: .bottom) {
            AsyncImage(url: URL(string: friend.image), content: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }, placeholder: {
                Color.red
            })
            VStack {
                HStack {
                    Text(friend.name)
                    Image(systemName: "checkmark.circle")
                }
                Text("CDMX 22 km")
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.ultraThinMaterial)
            )
            .offset(y: -13)
        }
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

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
