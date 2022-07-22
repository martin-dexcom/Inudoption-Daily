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
            InudoptionTabView()
        }
    }
}
