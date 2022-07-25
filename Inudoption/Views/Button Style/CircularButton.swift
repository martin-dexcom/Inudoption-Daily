//
//  CircularButton.swift
//  Inudoption
//
//  Created by Andres De La Cruz on 7/25/22.
//

import SwiftUI

struct CircularButton: ButtonStyle {
    let type: ButtonType
    //    if type == match { this } else { that}
    //    type == match ? this : that
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .frame(width: 54, height: 54)
            .background(type == .match ? .red : .white)
            .foregroundColor(type == .match ? .orange : .red)
            .clipShape(Circle())
            .opacity(configuration.isPressed ? 0.95 : 1)
            .shadow(radius: 2)
    }
}
