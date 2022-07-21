//
//  InudoptionApp.swift
//  Inudoption
//
//  Created by Martin García on 7/18/22.
//

import SwiftUI

@main
struct MyApp: App {
    @AppStorage("shouldShowMainScreen") var shouldShowMainScreen = false

    var body: some Scene {
        WindowGroup {
            VStack {
                if shouldShowMainScreen {
                    TabView {
                        MainScreen()
                            .tabItem {
                                Label("Adoption", systemImage: "pawprint.fill")
                            }
                        FeaturesView(shouldShowMainScreen: $shouldShowMainScreen)
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
}
