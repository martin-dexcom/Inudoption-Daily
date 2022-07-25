//
//  Card.swift
//  Inudoption
//
//  Created by Andres De La Cruz on 7/25/22.
//

import SwiftUI

struct Card: View {
    let friend: Friend
    
    var body: some View {
        ZStack(alignment: .bottom) {
            AsyncImage(url: URL(string: friend.image)) { image in
                image
                    .resizable()
            } placeholder: {
                ProgressView()
            }
            FriendDetails(friend: friend)
            .offset(y: -15)
        }
        .cornerRadius(8)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(friend: Friend(name: "Nina",
                            image: "https://inudoption-custom-pics.s3.us-west-1.amazonaws.com/doggys2.jpeg",
                            animal: .dog,
                            fact: "She really really likes McDonalds French Fries",
                            dateOfBirth: ""))
    }
}
