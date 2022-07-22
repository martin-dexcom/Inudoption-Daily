//
//  InuNetworkLayer.swift
//  Inudoption
//
//  Created by Daniel Moreno on 7/21/22.
//

import Foundation
import Combine

class InuNetworkLayer {

    static let shared = InuNetworkLayer()

    private let inudoptionEndpoint = "https://qfh2rnry06.execute-api.us-west-1.amazonaws.com/dev/pets"

    func friendsFromInudoption(friendCount: Int) -> AnyPublisher<[Friend], Error> {
        let finalURL = "\(inudoptionEndpoint)?count=\(friendCount)"
        guard let url = URL(string: finalURL) else {
            return Empty(completeImmediately: false).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Friend].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
