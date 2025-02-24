//
//  RememberApp.swift
//  Remember
//
//  Created by Olivia Moreau on 17/01/2025.
//

import SwiftUI

@main
struct RememberApp: App {
    @StateObject private var capsuleController = CapsuleController(capsules: [
            Capsule(
                id: UUID(),
                title: "Paris 2024",
                description: "Description de la capsule 1",
                creationDate: Date(),
                unlockDate: Date().addingTimeInterval(86400), // 1 jour après
                medias: [
                    Media(id: UUID(), url: "https://picsum.photos/1000/1000", type: MediaType.Image, image: nil),
                    Media(id: UUID(), url: "https://picsum.photos/1000/1000", type: MediaType.Image, image: nil),
                    Media(id: UUID(), url: "https://picsum.photos/1000/1000", type: MediaType.Image, image: nil),
                    Media(id: UUID(), url: "https://picsum.photos/1000/1000", type: MediaType.Image, image: nil),
                    Media(id: UUID(), url: "https://picsum.photos/1000/1000", type: MediaType.Image, image: nil),
                    Media(id: UUID(), url: "https://picsum.photos/1000/1000", type: MediaType.Image, image: nil)
                ],
                location: "Paris, France",
                isLocked: true
            ),
            Capsule(
                id: UUID(),
                title: "Tunis 2013",
                description: "Description de la capsule 2",
                creationDate: Date(),
                unlockDate: Date().addingTimeInterval(86400), // 1 jour après
                medias: [
                    Media(id: UUID(), url: "https://picsum.photos/1000/1000", type: MediaType.Image, image: nil),
                    Media(id: UUID(), url: "https://picsum.photos/1000/1000", type: MediaType.Image, image: nil),
                    Media(id: UUID(), url: "https://picsum.photos/1000/1000", type: MediaType.Image, image: nil)
                ],
                location: "Tunis, Tunisie",
                isLocked: false
            )
        ])
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(capsuleController)
        }
    }
}
