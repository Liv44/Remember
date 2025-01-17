//
//  CapsuleManager.swift
//  Remember
//
//  Created by Olivia Moreau on 17/01/2025.
//

import Foundation

func updateCapsuleStatus (capsule : Capsule) -> Capsule {
    if !capsule.isLocked {
        return capsule
    }
    
    if capsule.unlockDate < Date.now {
        var updatedCapsule = capsule
        updatedCapsule.isLocked = false
        return updatedCapsule
    } else {
        return capsule
    }
}
