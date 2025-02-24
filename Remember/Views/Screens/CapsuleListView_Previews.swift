//
//  CapsuleDetailView_Previews.swift
//  Remember
//
//  Created by Olivia Moreau on 24/02/2025.
//

import Foundation
import SwiftUI

struct CapsuleListView_Previews: PreviewProvider {
    static var previews: some View {
        let capsuleController = CapsuleController(capsules: [
            Capsule(
                id: UUID(),
                title: "Paris 2024",
                description: "Description de la capsule 1",
                creationDate: Date(),
                unlockDate: Date().addingTimeInterval(86400), // 1 jour après
                medias: [
                    Media(id: UUID(), url: "https://picsum.photos/1000/1000", type: .Image, image: nil)
                ],
                location: "Paris, France",
                isLocked: true
            ),
            Capsule(
                id: UUID(),
                title: "Paris 2024",
                description: "Description de la capsule 1",
                creationDate: Date(),
                unlockDate: Date().addingTimeInterval(86400), // 1 jour après
                medias: [
                    Media(id: UUID(), url: "https://picsum.photos/1000/1000", type: .Image, image: nil)
                ],
                location: "Paris, France",
                isLocked: false
            )
        ])

        return CapsuleListView().environmentObject(capsuleController)
       }
    
}
