//
//  RememberApp.swift
//  Remember
//
//  Created by Olivia Moreau on 17/01/2025.
//

import Foundation
import SwiftUI

@main
struct RememberApp: App {
    static let sampleCapsules: [Capsule] = {
        let isoFormatter = ISO8601DateFormatter()
        return [
            Capsule(
                id: UUID(),
                title: "Paris 2024",
                description: "Visite de Paris avec les copains",
                creationDate: isoFormatter.date(from: "2024-10-2T12:00:00Z") ?? Date(),
                unlockDate: isoFormatter.date(from: "2025-02-2T12:00:00Z") ?? Date(),
                medias: [
                       Media(id: UUID(), url: "https://plus.unsplash.com/premium_photo-1661919210043-fd847a58522d?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8UGFyaXN8ZW58MHx8MHx8fDA%3D", type: MediaType.Image, image: nil),
                       Media(id: UUID(), url: "https://images.unsplash.com/photo-1499856871958-5b9627545d1a?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8UGFyaXN8ZW58MHx8MHx8fDA%3D", type: MediaType.Image, image: nil),
                       Media(id: UUID(), url: "https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8UGFyaXN8ZW58MHx8MHx8fDA%3D", type: MediaType.Image, image: nil),
                       Media(id: UUID(), url: "https://images.unsplash.com/photo-1509439581779-6298f75bf6e5?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fFBhcmlzfGVufDB8fDB8fHww", type: MediaType.Image, image: nil),
                       Media(id: UUID(), url: "https://images.unsplash.com/photo-1471623320832-752e8bbf8413?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fFBhcmlzfGVufDB8fDB8fHww", type: MediaType.Image, image: nil),
                       Media(id: UUID(), url: "https://picsum.photos/1000/1000", type: MediaType.Image, image: nil)
                   ],
                location: "Paris, France",
                isLocked: false
            ),
            Capsule(
                id: UUID(),
                title: "Tunis 2020",
                description: "Voyage en famille en Tunisie",
                creationDate: isoFormatter.date(from: "2020-08-17T12:00:00Z") ?? Date(),
                unlockDate: isoFormatter.date(from: "2022-08-17T12:00:00Z") ?? Date(),
                medias: [
                    Media(id: UUID(), url: "https://plus.unsplash.com/premium_photo-1697729832745-727415df238f?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8VHVuaXN8ZW58MHx8MHx8fDA%3D", type: .Image, image: nil),
                    Media(id: UUID(), url: "https://images.unsplash.com/photo-1556011573-875fbbf761fd?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8VHVuaXN8ZW58MHx8MHx8fDA%3D", type: .Image, image: nil),
                    Media(id: UUID(), url: "https://images.unsplash.com/photo-1594495293394-d1073510bf22?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8VHVuaXN8ZW58MHx8MHx8fDA%3D", type: .Image, image: nil),
                    Media(id: UUID(), url: "https://images.unsplash.com/photo-1573731500579-ea553ac6fb2e?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fFR1bmlzfGVufDB8fDB8fHww", type: .Image, image: nil),
                    Media(id: UUID(), url: "https://images.unsplash.com/photo-1555086834-0e1d9f4f9e9c?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8VHVuaXN8ZW58MHx8MHx8fDA%3D", type: .Image, image: nil)

                ],
                location: "Tunis, Tunisie",
                isLocked: false
            ),
            Capsule(
                id: UUID(),
                title: "Allemagne 2023",
                description: "Voyage Solo en Allemagne - Berlin, Stuttgart, et Cologne",
                creationDate: isoFormatter.date(from: "2023-05-17T12:00:00Z") ?? Date(),
                unlockDate: isoFormatter.date(from: "2024-10-17T12:00:00Z") ?? Date(),
                medias: [
                    Media(id: UUID(), url: "https://images.unsplash.com/photo-1467269204594-9661b134dd2b?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8QWxsZW1hZ25lfGVufDB8fDB8fHww", type: .Image, image: nil),
                    Media(id: UUID(), url: "https://images.unsplash.com/photo-1554072675-66db59dba46f?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8QWxsZW1hZ25lfGVufDB8fDB8fHww", type: .Image, image: nil),
                    Media(id: UUID(), url: "https://images.unsplash.com/photo-1528728329032-2972f65dfb3f?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8QWxsZW1hZ25lfGVufDB8fDB8fHww", type: .Image, image: nil),
                    Media(id: UUID(), url: "https://images.unsplash.com/photo-1501952476817-d7ae22e8ee4e?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8QWxsZW1hZ25lfGVufDB8fDB8fHww", type: .Image, image: nil)
                ],
                location: "Berlin, Allemagne",
                isLocked: false
            ),
            Capsule(
                id: UUID(),
                title: "Allemagne 2025",
                description: "Retour en Allemagne en famille",
                creationDate: isoFormatter.date(from: "2025-01-17T12:00:00Z") ?? Date(),
                unlockDate: isoFormatter.date(from: "2026-01-17T12:00:00Z") ?? Date(),
                medias: [
                    Media(id: UUID(), url: "https://images.unsplash.com/photo-1554072675-66db59dba46f?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8QWxsZW1hZ25lfGVufDB8fDB8fHww", type: .Image, image: nil),
                    Media(id: UUID(), url: "https://images.unsplash.com/photo-1467269204594-9661b134dd2b?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8QWxsZW1hZ25lfGVufDB8fDB8fHww", type: .Image, image: nil),
                    Media(id: UUID(), url: "https://images.unsplash.com/photo-1528728329032-2972f65dfb3f?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8QWxsZW1hZ25lfGVufDB8fDB8fHww", type: .Image, image: nil),
                    Media(id: UUID(), url: "https://images.unsplash.com/photo-1501952476817-d7ae22e8ee4e?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8QWxsZW1hZ25lfGVufDB8fDB8fHww", type: .Image, image: nil)
                ],
                location: "Berlin, Allemagne",
                isLocked: true
            ),
            Capsule(
                id: UUID(),
                title: "Lille 2025",
                description: "Week-end à Lille",
                creationDate: isoFormatter.date(from: "2025-02-01T12:00:00Z") ?? Date(),
                unlockDate: isoFormatter.date(from: "2025-05-15T12:00:00Z") ?? Date(),
                medias: [
                    Media(id: UUID(), url: "https://images.unsplash.com/photo-1608651422537-da1f24fdc6fe?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8TGlsbGV8ZW58MHx8MHx8fDA%3D", type: .Image, image: nil),
                    Media(id: UUID(), url: "https://images.unsplash.com/photo-1581284189101-f23d0ed70e29?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8TGlsbGV8ZW58MHx8MHx8fDA%3D", type: .Image, image: nil)
                ],
                location: "Lille, France",
                isLocked: true
            ),
            Capsule(
                id: UUID(),
                title: "Strasbourg 2024",
                description: "Strasbourg entre potes",
                creationDate: isoFormatter.date(from: "2024-11-29T12:00:00Z") ?? Date(),
                unlockDate: isoFormatter.date(from: "2025-11-29T12:00:00Z") ?? Date(),
                medias: [
                    Media(id: UUID(), url: "https://images.unsplash.com/photo-1598875793784-55488654fb0b?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8U3RyYXNib3VyZ3xlbnwwfHwwfHx8MA%3D%3D", type: .Image, image: nil),
                    Media(id: UUID(), url: "https://images.unsplash.com/photo-1502132043341-412103586212?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8U3RyYXNib3VyZ3xlbnwwfHwwfHx8MA%3D%3D", type: .Image, image: nil),
                    Media(id: UUID(), url: "https://images.unsplash.com/photo-1567431494112-d1d9a165951f?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fFN0cmFzYm91cmd8ZW58MHx8MHx8fDA%3D", type: .Image, image: nil)
                ],
                location: "Lille, France",
                isLocked: true
            )
        ]
    }()

    @StateObject private var userController = UserController(users: [
        User(id: UUID(), username: "louisteilliais", email: "louisteilliais@gmail.com", capsules: []),
        User(id: UUID(), username: "oliviamoreau", email: "oliviamoreau@gmail.com", capsules: [])
    ])
    
    @StateObject private var capsuleController = CapsuleController(capsules: sampleCapsules)

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(capsuleController)
                .environmentObject(userController)
        }
    }
}
