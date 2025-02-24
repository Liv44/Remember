//
//  CardCapsuleListComponent.swift
//  Remember
//
//  Created by Olivia Moreau on 24/02/2025.
//

import SwiftUI

struct CardCapsuleListComponent: View {
    var capsule : Capsule;
    
    var body: some View {
        NavigationLink(destination: CapsuleDetailView(capsule: capsule)) {
            VStack{
                let media = capsule.medias[0]
                if media.type == .Image {
                    if let image = media.image {
                        // Affichage des images
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .cornerRadius(8)
                            .shadow(radius: 5)
                    } else if let url = media.url, let imageUrl = URL(string: url) {
                        // Affichage des images à partir de l'URL
                        AsyncImage(url: imageUrl) { phase in
                            switch phase {
                            case .empty:
                                ProgressView().frame(width: 150, height: 150) // Chargement de l'image
                            case .success(let image):
                                image
                                    .scaledToFill()
                                    .frame(width: 150, height: 150)
                                    .cornerRadius(8)
                                    .shadow(radius: 5)
                            case .failure:
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.red)
                            @unknown default:
                                EmptyView()
                            }
                        }
                    }
                }
                VStack(alignment: .leading) {
                    Text(capsule.title)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    if(capsule.isLocked) {
                        Text("Ouverture : \(capsule.unlockDate, formatter: DateFormatter.dateFormatter)") .font(.subheadline)
                            .foregroundColor(.gray)
                    } else {
                        Text("Créé le : \(capsule.creationDate, formatter: DateFormatter.dateFormatter)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                       
                }
            }
            
        }
    }
}

#Preview {
    CardCapsuleListComponent(capsule: Capsule(
        id: UUID(),
        title: "Paris 2024",
        description: "Description de la capsule 1",
        creationDate: Date(),
        unlockDate: Date().addingTimeInterval(86400), // 1 jour après
        medias: [
            Media(id: UUID(), url: "https://picsum.photos/1000/1000", type: .Image, image: nil),
            Media(id: UUID(), url: "https://picsum.photos/1000/1000", type: .Image, image: nil),
            Media(id: UUID(), url: "https://picsum.photos/1000/1000", type: .Image, image: nil)
        ],
        location: "Paris, France",
        isLocked: false
    ))
}
