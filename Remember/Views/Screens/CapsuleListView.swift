//
//  ListeCapsulesView.swift
//  Remember
//
//  Created by Louis Teilliais on 07/02/2025.
//


import SwiftUI

struct CapsuleListView: View {
    let capsules : [Capsule] = [
        Capsule(
            id: UUID(),
            title: "Capsule 1",
            description: "Description de la capsule 1",
            creationDate: Date(),
            unlockDate: Date().addingTimeInterval(86400), // 1 jour après
            medias: [
                Media(id: UUID(), url: "https://www.nature-isere.fr/sites/default/files/images/temoignages/principale/iceland-2111810_1920.jpg", type: MediaType.Image),
                Media(id: UUID(), url: "https://www.nature-isere.fr/sites/default/files/images/temoignages/principale/iceland-2111810_1920.jpg", type: MediaType.Image),
                Media(id: UUID(), url: "https://www.nature-isere.fr/sites/default/files/images/temoignages/principale/iceland-2111810_1920.jpg", type: MediaType.Image),
                Media(id: UUID(), url: "https://www.nature-isere.fr/sites/default/files/images/temoignages/principale/iceland-2111810_1920.jpg", type: MediaType.Image),
                Media(id: UUID(), url: "https://www.nature-isere.fr/sites/default/files/images/temoignages/principale/iceland-2111810_1920.jpg", type: MediaType.Image),
                Media(id: UUID(), url: "https://www.nature-isere.fr/sites/default/files/images/temoignages/principale/iceland-2111810_1920.jpg", type: MediaType.Image)
            ],
            location: "Paris, France",
            isLocked: true
        ),
        Capsule(
            id: UUID(),
            title: "Capsule 2",
            description: "Description de la capsule 1",
            creationDate: Date(),
            unlockDate: Date().addingTimeInterval(86400), // 1 jour après
            medias: [
                Media(id: UUID(), url: "https://example.com/image1.jpg", type: MediaType.Image),
                Media(id: UUID(), url: "https://example.com/video1.mp4", type: MediaType.Video)
            ],
            location: "Paris, France",
            isLocked: false
        ),
    ]
    
    var body: some View {
        NavigationView {
            List(capsules) { capsule in
                NavigationLink(destination: CapsuleDetailView(capsule: capsule)) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(capsule.title)
                                .font(.headline)
                            Text(capsule.description)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Text(DateFormatter.dateFormatter.string(from: capsule.creationDate))
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        if capsule.isLocked {
                            Image(systemName: "lock.fill") 
                                .foregroundColor(.gray)
                                .padding(.leading, 8)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Liste des Capsules")
        }
    }

}
