//
//  ContentView.swift
//  Inudoption
//
//  Created by Martin García on 7/18/22.
//

import SwiftUI

struct Feature {
    let title: String
    let description: String
    let imageName: String
}

struct ContentView: View {
    let features: [Feature] = [
        Feature(title: "Dogs?",
                description: "Cats",
                imageName: "pawprint.fill"),
        Feature(title: "Feature 2",
                description: "Description2",
                imageName: "pawprint.fill"),
        Feature(title: "Feature 3",
                description: "Description3",
                imageName: "pawprint.fill")
    ]

    var body: some View {
        VStack(alignment: .leading) {
            ReusableTitle(topTitle: "Welcome to", bottomTitle: "Inudoption")
            VStack(alignment: .leading, spacing: 20) {
                ReusableRow(feature: features[0])
            }
        }
    }
}

struct ReusableRow: View {
    let feature: Feature

    var body: some View {
        HStack {
            ReusableRoundedIcon(imageName: feature.imageName)
            VStack(alignment: .leading, spacing: 0) {
                Text(feature.title)
                    .font(.headline)
                Text(feature.description)
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct ReusableRoundedIcon: View {
    let imageName: String

    var body: some View {
        ZStack(alignment: .center) {
            // 0
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 53, height: 53)
                .foregroundColor(.orange)
            // 1
            Image(systemName: imageName)
                .imageScale(.large)
                .foregroundColor(.gray)
        }
    }
}

struct ReusableTitle: View {
    let topTitle: String
    let bottomTitle: String

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(topTitle)
                .font(.subheadline)
                .bold()
                .foregroundColor(.gray)
            Text(bottomTitle)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.orange)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
