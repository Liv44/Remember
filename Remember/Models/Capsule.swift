//
//  Capsule.swift
//  Remember
//
//  Created by Olivia Moreau on 17/01/2025.
//

import Foundation
import SwiftUICore
import MapKit


struct Capsule : Identifiable {
    let id: UUID
    var title: String
    var description : String
    var creationDate: Date
    var unlockDate: Date
    var medias : [Media]
    var location : String
    
    var isLocked : Bool = true
}

enum MediaType {
    case Image
    case Video
}

struct Media : Identifiable {
    let id: UUID
    var url: String?
    let type: MediaType
    let image: UIImage?
}
