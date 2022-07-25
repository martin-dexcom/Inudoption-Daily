//
//  FriendDetails.swift
//  Inudoption
//
//  Created by Andres De La Cruz on 7/25/22.
//

import SwiftUI

struct FriendDetails: View {
    let friend: Friend
    
    var body: some View {
        VStack {
            HStack(spacing: 4) {
                Text(friend.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                if friend.isVerified {
                    Image("Checkmark")
                        .resizable()
                        .frame(width: 16, height: 16)
                }
            }
            Text(friend.animal.rawValue)
                .font(.caption)
                .fontWeight(.regular)
                .foregroundColor(.secondary)
        }
        .padding(.horizontal, 28)
        .padding(.top, 8)
        .padding(.bottom, 12)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThickMaterial)
        )
    }
}

struct FriendDetails_Previews: PreviewProvider {
    static var previews: some View {
        FriendDetails(friend: Friend(
            name: "Nina",
            image: "https://inudoption-custom-pics.s3.us-west-1.amazonaws.com/doggys2.jpeg",
            animal: .dog,
            fact: "She really really likes McDonalds French Fries",
            dateOfBirth: ""))
    }
}
