//
//  CapsuleDetailView.swift
//  Remember
//
//  Created by Louis Teilliais on 07/02/2025.
//
import SwiftUI

struct CapsuleDetailView: View {
    var capsule: Capsule
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())] // 2 colonnes avec un espacement flexible
    
    var body : some View {
        ScrollView {
            // Affichage du titre avec un cadenas si la capsule est verrouillée
            if capsule.isLocked {
                HStack {
                    Text(capsule.title)
                        .foregroundColor(.primary)
                    Spacer()
                    Image(systemName: "lock.fill")
                        .foregroundColor(.primary)
                }
            } else {
                Text(capsule.title)
                    .foregroundColor(.primary)
                    .font(.headline)
            }
            
            // Affichage de la description
            Text(capsule.description)
                .font(.body)
                .padding([.horizontal])
            
            // Affichage des médias (images/vidéos) dans une grille
            if !capsule.medias.isEmpty {
                VStack {
                    Text("Médias de la capsule")
                        .font(.subheadline)
                        .padding([.top, .horizontal])
                    
                    // Grille avec 2 colonnes
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(capsule.medias) { media in
                            if media.type == .Image {
                                // Affichage des images
                                AsyncImage(url: URL(string: media.url)) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView() // Chargement de l'image
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 150)
                                            .cornerRadius(8)
                                            .shadow(radius: 5)
                                            .blur(radius: capsule.isLocked && Date() < capsule.unlockDate ? 5 : 0) // Flou si verrouillé
                                    case .failure:
                                        Image(systemName: "xmark.circle.fill")
                                            .foregroundColor(.red)
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                            }
                        }
                    }
                    .padding([.horizontal])
                }
            } else {
                Text("Aucun média disponible")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding([.horizontal])
            }
            
            // Affichage des dates
            Text("Date de création: \(capsule.creationDate, formatter: DateFormatter.dateFormatter)")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding([.horizontal])

            Text("Date de déverrouillage: \(capsule.unlockDate, formatter: DateFormatter.dateFormatter)")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding([.horizontal])
        }
        .navigationTitle(capsule.title)
    }
}





