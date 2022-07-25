//
//  InudoptionTabView.swift
//  Inudoption
//
//  Created by Daniel Moreno on 7/21/22.
//

import SwiftUI

struct InudoptionTabView: View {
    @AppStorage("shouldShowMainScreen") var shouldShowMainScreen = false

    var body: some View {
        VStack {
            if shouldShowMainScreen {
                TabView {
                    MainScreen()
                        .tabItem {
                            Label("Adoption", systemImage: "pawprint.fill")
                        }
                    SettingsView()
                        .tabItem {
                            Label("Settings", systemImage: "gear")
                        }
                }
            } else {
                FeaturesView(shouldShowMainScreen: $shouldShowMainScreen)
            }
        }
    }
}

struct InudoptionTabView_Previews: PreviewProvider {
    static var previews: some View {
        InudoptionTabView()
    }
}
