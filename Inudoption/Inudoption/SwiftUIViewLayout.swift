//
//  SwiftUIViewLayout.swift
//  Inudoption
//
//  Created by Daniel Moreno on 7/19/22.
//

import SwiftUI

struct SwiftUIViewLayout: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .frame(width: 200, height: 200, alignment: .center)
                .background(Color.red)
        }
        .debug()
    }
}

extension View {
    func debug() -> Self {
        let mirror = Mirror(reflecting: self).subjectType
        print(mirror)
        return self
    }
}

struct SwiftUIViewLayout_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIViewLayout()
    }
}
