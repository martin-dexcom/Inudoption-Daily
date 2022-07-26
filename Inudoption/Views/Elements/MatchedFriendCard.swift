//
//  MatchedFriendCard.swift
//  Inudoption
//
//  Created by Andres De La Cruz on 7/26/22.
//

import SwiftUI

struct MatchedFriendView: View {
    let friend: Friend
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Image
            AsyncImage(url: URL(string: friend.image)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            // Info View.
            HStack(spacing: 2) {
                Spacer()
                Text(friend.name)
                    .font(.system(size: 8,
                                  weight: .semibold,
                                  design: .default))
                if friend.isVerified {
                    Image("Checkmark")
                        .resizable()
                        .frame(width: 10, height: 10)
                }
                Spacer()
            }
            .background(.ultraThinMaterial)
            .cornerRadius(8)
            .padding(.horizontal, 8)
            .padding(.vertical, 2)
            .offset(y: -5)
        }
        .cornerRadius(8)
        .frame(width: 105, height: 70, alignment: .center)
    }
}

struct MatchedFriendView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedFriendView(friend: Friend(name: "Nina",
                                         image: "https://inudoption-custom-pics.s3.us-west-1.amazonaws.com/doggys2.jpeg",
                                         animal: .dog,
                                         fact: "She likes to go the beach.",
                                         dateOfBirth: "empty"))
    }
}
