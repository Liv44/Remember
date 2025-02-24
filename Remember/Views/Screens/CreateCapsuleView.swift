//
//  CreationCapsuleView.swift
//  Remember
//
//  Created by Louis Teilliais on 07/02/2025.
//


import SwiftUI
import MapKit

struct CreateCapsuleView: View {
    @State private var titreCapsule: String = ""
    @State private var lieuCapsule: String = ""
    @State private var collaborateurCapsule: String = ""
    @State private var contenuCapsule: String = ""
    @State private var selectedDate: Date = Date()
    
    @State private var unlockDate: Date = Date()
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Titre")) {
                    TextField("Entrez un titre", text: $titreCapsule)
                }
                
                Section {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Date de création")
                            UnlockDateSelectorComponent(
                                selectedDate: $selectedDate,
                                minimumDate: Date(),
                                maximumDate: Calendar.current.date(byAdding: .year, value: 1, to: Date()),
                                title: "Choisissez une date"
                            )
                        }
                        .frame(maxWidth: .infinity)
                        Spacer(minLength: 20)

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
                    TextField("Entrez le lieu de la capsule", text: $lieuCapsule)
                }
                Section(header: Text("Collaborateurs")) {
                    TextField("Collaborateurs de la capsule", text: $collaborateurCapsule)
                }
                Section(header: Text("Médias")) {
                    MediaPickerComponent()
                }
                .listRowBackground(Color.clear)
                
                Section{
                    Button(action: {
                       print("Créer une capsule")
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
                   .padding(.vertical)
                }
                .listRowBackground(Color.clear)
                


            }
            .navigationTitle("Créer une capsule")
        }
    }

}

