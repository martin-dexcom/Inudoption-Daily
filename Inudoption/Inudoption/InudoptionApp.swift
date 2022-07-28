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
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate

    var body: some Scene {
        WindowGroup {
            InudoptionTabView()
        }
    }
}
