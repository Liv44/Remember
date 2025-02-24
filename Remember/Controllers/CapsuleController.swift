//
//  CapsuleController.swift
//  Remember
//
//  Created by Olivia Moreau on 17/01/2025.
//

import Foundation

enum CapsuleError: Error, Equatable {
    case capsuleNotFound(String)
    case invalidDate(String)
}

class CapsuleController: ObservableObject {
    @Published var capsules: [Capsule]
    
    init(capsules: [Capsule]) {
        self.capsules = capsules
    }
    
    func getCapsuleById(id: UUID) throws -> Capsule {
        guard let capsule = capsules.first(where: { $0.id == id }) else {
            throw CapsuleError.capsuleNotFound("Capsule not found")
        }
        return capsule
    }
    
    func createCapsule(title: String, description: String, unlockDate: Date, medias: [Media], location: String) throws -> Capsule {
        guard unlockDate > Date() else {
            throw CapsuleError.invalidDate("unlock Date must be after creation Date");
        }
        
        let newCapsule = Capsule(id: UUID(), title: title, description: description, creationDate: Date.now, unlockDate: unlockDate, medias: medias, location: location)
        capsules.append(newCapsule);
        return newCapsule
    }
    
    func updateCapsule(id: UUID, title: String? = nil, description: String? = nil, unlockDate: Date? = nil, medias: [Media]? = nil, location: String? = nil) throws -> Capsule {
        var capsuleToUpdate = try getCapsuleById(id: id)
        
        if let newTitle = title {
            capsuleToUpdate.title = newTitle;
        }
        
        if let newDescription = description {
            capsuleToUpdate.description = newDescription;
        }
        if let newUnlockDate = unlockDate {
            guard newUnlockDate > Date() else {
                throw CapsuleError.invalidDate("unlock Date must be after updated Date");
            }
            capsuleToUpdate.unlockDate = newUnlockDate;
        }
        if let newMedias = medias {
            capsuleToUpdate.medias = newMedias;
        }
        if let newLocation = location {
            capsuleToUpdate.location = newLocation;
        }
        
        if let row = self.capsules.firstIndex(where: {$0.id == id}) {
            capsules[row] = capsuleToUpdate
        }
        
        return capsuleToUpdate
    }
    
    func deleteCapsule(id: UUID) throws {
        var capsuleToDelete = try getCapsuleById(id: id)
        
        capsules.removeAll { $0.id == id }
    }
}
