//
//  Rules.swift
//  GNAR
//
//  Created by Spencer Holm on 3/16/21.
//

import Foundation
import SwiftUI



struct Categories: Hashable, Codable, Identifiable {
    var id: Int
    var type: String
    var rules: [Points]
}

struct Points: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var type: String
    var points: String
    var description: String
}

