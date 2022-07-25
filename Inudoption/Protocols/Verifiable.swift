//
//  Verifiable.swift
//  Inudoption
//
//  Created by Andres De La Cruz on 7/25/22.
//

import Foundation

protocol Verifiable {
    var isVerified: Bool { get }
    mutating func verify()
}
