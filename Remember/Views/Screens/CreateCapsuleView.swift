//
//  CreationCapsuleView.swift
//  Remember
//
//  Created by Louis Teilliais on 07/02/2025.
//


import SwiftUI
import MapKit

struct CreateCapsuleView: View {
    @EnvironmentObject var capsuleController: CapsuleController
    var onCapsuleCreated: () -> Void

    @State private var title: String = ""
    @State private var location: String = ""
    @State private var collaborator: String = ""
    @State private var description: String = ""
    @State private var selectedDate: Date = Date()
    
    @State private var unlockDate: Date = Date()
    
    @State private var selectedImages: [UIImage] = []
    
    @State private var errorMessage: String?
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Titre")) {
                    TextField("Entrez un titre", text: $title)
                }
                Section(header: Text("Description")) {
                    TextField("Description de la capsule", text: $description)
                }
                Section {
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Date de fermeture")
                            UnlockDateSelectorComponent(
                                selectedDate: $unlockDate,
                                minimumDate: Date(),
                                maximumDate: Calendar.current.date(byAdding: .year, value: 1, to: Date()),
                                title: "Choisissez une date"
                            )
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .frame(maxWidth: .infinity)
                    .listRowBackground(Color.clear)
                }
                Section(header: Text("Lieu")) {
                    TextField("Entrez le lieu de la capsule", text: $location)
                }
                Section(header: Text("Médias")) {
                    MediaPickerComponent(selectedImages: $selectedImages)
                }
                .listRowBackground(Color.clear)
                
                Section{
                    Button(action: {
                       print("Créer une capsule")
                        do {
                            let medias = selectedImages.map { image in
                               Media(id: UUID(), url: nil, type: .Image, image: image)
                           }
                            try _ = capsuleController.createCapsule(
                                title: title,
                                description: description,
                                unlockDate: unlockDate,
                                medias: medias,
                                location: location
                            )
                            // Réinitialiser les champs après la création réussie
                            title = ""
                            location = ""
                            collaborator = ""
                            description = ""
                            selectedDate = Date()
                            unlockDate = Date()
                            errorMessage = nil
                            onCapsuleCreated()
                        } catch {
                            if let capsuleError = error as? CapsuleError {
                                switch capsuleError {
                                case .capsuleNotFound(let message):
                                    errorMessage = message
                                case .invalidDate(let message):
                                    errorMessage = message
                                }
                            } else {
                                errorMessage = "Une erreur inconnue s'est produite."
                            }
                        }
                       // Ajoute ici la logique pour créer une capsule
                   }) {
                       Text("Créer une capsule")
                           .font(.headline)
                           .frame(maxWidth: .infinity)
                           .padding()
                           .background(Color.blue)
                           .foregroundColor(.white)
                           .cornerRadius(8)
                           .padding(.horizontal)
                   }
                
                    
                    if let errorMessage = errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding()
                    }
                }
                .listRowBackground(Color.clear)
                


            }
            .navigationTitle("Créer une capsule")
        }
    }

}

