//
//  InudoptionApp.swift
//  Inudoption
//
//  Created by Martin García on 7/18/22.
//

import SwiftUI

@main
struct InudoptionApp: App {

    @AppStorage("shouldShowMainScreen") var shouldShowMainScreen = false

    var body: some Scene {
        WindowGroup {
            if shouldShowMainScreen {
                MainScreen()
            } else {
                FeaturesView(shouldShowMainScreen: $shouldShowMainScreen)
            }
        }
    }
}
