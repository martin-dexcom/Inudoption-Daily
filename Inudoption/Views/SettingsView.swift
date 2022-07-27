//
//  SettingsView.swift
//  Inudoption
//
//  Created by Daniel Moreno on 7/21/22.
//

import SwiftUI

struct SettingsView: View {
    @State var isEditing = false

    @AppStorage("preferredAge") var age: Double = 0.0
    @AppStorage("preferredAnimal") var preferredAnimal: Animal = .dog

    var body: some View {
        VStack(alignment: .leading) {
            ReusableTitle(topTitle: "Preferences",
                          bottomTitle: "and Settings")
            .padding(.top, 8)
            Spacer()
            VStack(alignment: .leading) {
                Text("Pet Preference")
                    .modifier(SecondaryLabelStyle())
                HStack {
                    ForEach(Animal.allCases, id: \.self) { animal in
                        Button(animal.rawValue) {
                            preferredAnimal = animal
                        }
                        .background(preferredAnimal == animal ? Color.inuSecondary : .gray)
                    }
                }
                .buttonStyle(PreferenceButtonStyle())
                Text("Max. Age")
                    .modifier(SecondaryLabelStyle())
                Slider(value: $age, in: 0...100, step: 1) {
                    Text("Speed")
                } minimumValueLabel: {
                    Text("0")
                } maximumValueLabel: {
                    Text("100")
                } onEditingChanged: { editing in
                    isEditing = editing
                }
                .foregroundColor(Color.inuPrimary)
            }
            Spacer()
        }
        .padding()
    }
}

struct SecondaryLabelStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.gray)
    }
}

struct PreferenceButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

