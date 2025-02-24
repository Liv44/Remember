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
    
    // Fonction pour calculer le nombre de jours entre deux dates
    func timeBetween(startDate: Date, endDate: Date) -> (days: Int, hours: Int, minutes: Int) {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .hour, .minute], from: startDate, to: endDate)
        return (components.day ?? 0, components.hour ?? 0, components.minute ?? 0)
    }
    
    var body : some View {
        ScrollView {
            // Affichage du titre avec un cadenas si la capsule est verrouillée
            HStack {
                if(capsule.isLocked) {
                    VStack {
                        Image(systemName: "lock.fill")
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                    }
                    .frame(width: 35, height: 50)
                }
                Text(capsule.title)
                    .foregroundColor(.primary)
                    .fontWeight(Font.Weight.bold)
                    .fontDesign(Font.Design.rounded)
                    .font(.system(size: 50))
            }
            if capsule.isLocked {
                let timeComponents = timeBetween(startDate: Date(), endDate: capsule.unlockDate)
                if timeComponents.days > 0 {
                    Text("Ouverture dans : \(timeComponents.days) jours")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                } else {
                    Text("Ouverture dans : \(timeComponents.hours) heures et \(timeComponents.minutes) minutes")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            Spacer().frame(width:30)
            Text("Données")
                .foregroundColor(.primary)
                .fontWeight(Font.Weight.bold)
                .fontDesign(Font.Design.rounded)
                .font(.system(size: 20))
            Spacer().frame(width:20)
            VStack(alignment: .leading,spacing: 6){
                // Affichage de la description
                Text("Description : " + capsule.description).multilineTextAlignment(.leading)
                Text("Date d'ouverture: \(capsule.unlockDate, formatter: DateFormatter.dateFormatter)")
                Text("Date de création: \(capsule.creationDate, formatter: DateFormatter.dateFormatter)")
                Text("Nombre de photos à découvrir : \(capsule.medias.count)")
            }
            
            Spacer(minLength: 20)
            
            // Affichage des médias (images/vidéos) dans une grille
            if !capsule.medias.isEmpty {
                VStack {
                    Text("Photos")
                        .fontWeight(Font.Weight.bold)
                        .fontDesign(Font.Design.rounded)
                        .font(.system(size: 20))
                    
                    // Grille avec 2 colonnes
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(capsule.medias) { media in
                            if media.type == .Image {
                                if let image = media.image {
                                    // Affichage des images
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 150)
                                        .cornerRadius(8)
                                        .shadow(radius: 5)
                                        .blur(radius: capsule.isLocked && Date() < capsule.unlockDate ? 5 : 0) // Flou si verrouillé
                                } else if let url = media.url, let imageUrl = URL(string: url) {
                                    // Affichage des images à partir de l'URL
                                    AsyncImage(url: imageUrl) { phase in
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
                    }
                    .padding([.horizontal])
                }
            } else {
                Text("Aucun média disponible")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding([.horizontal])
            }
        }
    }
}





