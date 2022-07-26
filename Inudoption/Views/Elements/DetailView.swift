//
//  DetailView.swift
//  Inudoption
//
//  Created by Andres De La Cruz on 7/26/22.
//

import SwiftUI

struct DetailView: View {
    let friend: Friend
    let isAlreadyMatched: Bool
    // Closures
    let matchAction: () -> Void
    let discardAction: () -> Void
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Layer 0 - image
            AsyncImage(url: URL(string: friend.image)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            // Layer 1 - Details
            VStack(spacing: 8) {
                Text(friend.name)
                    .font(.largeTitle)
                    .bold()
                if friend.isVerified {
                    HStack(spacing: 5) {
                        Image("Checkmark")
                            .resizable()
                            .frame(width: 16, height: 16)
                        Text("Verified by Inudoption Co.")
                            .font(.caption)
                    }
                }
                Text("About")
                    .font(.title)
                    .bold()
                Text(friend.fact)
                    .font(.body)
                if !isAlreadyMatched {
                    HStack {
                        InuButton(action: {
                            discardAction()
                        }, type: .discard)
                        InuButton(action: {
                            matchAction()
                        }, type: .match)
                    }
                    .padding(.top, 16)
                }
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 35)
            .frame(maxWidth: .infinity)
            .background()
            .cornerRadius(8)
            .navigationBarHidden(true)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(friend: Friend(name: "Nina",
                                  image: "https://inudoption-custom-pics.s3.us-west-1.amazonaws.com/doggys2.jpeg",
                                  animal: .dog,
                                  fact: "She likes to go the beach.",
                                  dateOfBirth: "empty"),
                   isAlreadyMatched: false,
                   matchAction: { },
                   discardAction: { })
    }
}
