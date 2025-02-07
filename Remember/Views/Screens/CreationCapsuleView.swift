//
//  CreationCapsuleView.swift
//  Remember
//
//  Created by Louis Teilliais on 07/02/2025.
//


import SwiftUI

struct CreateCapsuleView: View {
    @State private var titreCapsule: String = ""
    @State private var contenuCapsule: String = ""
    @State private var selectedDate: Date = Date()

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Titre")) {
                    TextField("Entrez un titre", text: $titreCapsule)
                }
                Section(header: Text("Contenu")) {
                    TextEditor(text: $contenuCapsule)
                        .frame(height: 150)
                }
                MediaPickerComponent();
                VStack {
                UnlockDateSelectorComponent(
                            selectedDate: $selectedDate,
                            minimumDate: Calendar.current.date(byAdding: .year, value: -1, to: Date()), // Limite à 1 an dans le passé
                            maximumDate: Calendar.current.date(byAdding: .year, value: 1, to: Date()), // Limite à 1 an dans le futur
                            title: "Choisissez une date"
                        )
                        
                       // Text("Vous avez sélectionné : \(selectedDate, formatter: dateFormatter)")
                         //   .padding(.top, 20)
                    }
                    .padding()
                    }
                Button(action: {
                    // Logique de sauvegarde de la capsule
                    print("Capsule créée : \(titreCapsule)")
                }) {
                    Text("Créer Capsule")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .navigationTitle("Créer Capsule")
        }
    }

