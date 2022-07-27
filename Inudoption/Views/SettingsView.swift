//
//  SettingsView.swift
//  Inudoption
//
//  Created by Daniel Moreno on 7/21/22.
//

import SwiftUI

struct SettingsView: View {
    let settingsText: LocalizedStringKey = "settingsText"
    var body: some View {
        Text(settingsText)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
