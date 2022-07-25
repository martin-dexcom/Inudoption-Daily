//
//  InuButton.swift
//  Inudoption
//
//  Created by Andres De La Cruz on 7/25/22.
//

import SwiftUI

enum ButtonType {
    case match
    case discard
    
    // Computed Property
    var image: String {
        switch self {
            case .match:
            return "heart.fill"
            case .discard:
            return "xmark"
        }
    }
}

struct InuButton: View {
    let action: () -> Void
    let type: ButtonType
    
    var body: some View {
        Button {
            // Action to perform when we press it
            action()
        } label: {
            // What we should to the user
            Image(systemName: type.image)
        }
        .buttonStyle(CircularButton(type: type))
    }
}

struct InuButton_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            InuButton(action: {
                print("Not Debug yet")
            }, type: .discard)
            InuButton(action: {
                print("Not Debug yet")
            }, type: .match)
        }
    }
}
