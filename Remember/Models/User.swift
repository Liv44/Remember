//
//  User.swift
//  Remember
//
//  Created by Olivia Moreau on 17/01/2025.
//

import Foundation

struct User : Identifiable {
    let id : UUID
    var username : String
    var email : String
    var capsules : [Capsule]
}
