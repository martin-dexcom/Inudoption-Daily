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
        if shouldShowMainScreen {
            NavigationView {
                TabView {
                    MainScreen()
                        .tabItem {
                            Label("Adoption", systemImage: "pawprint.fill")
                        }
                        .navigationBarHidden(true)
                    SettingsView()
                        .tabItem {
                            Label("Settings", systemImage: "gear")
                        }
                }
            }
        } else {
            FeaturesView(shouldShowMainScreen: $shouldShowMainScreen)
        }
    }
}
