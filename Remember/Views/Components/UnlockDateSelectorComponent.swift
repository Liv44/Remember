//
//  UnlockDateSelectorComponent.swift
//  Remember
//
//  Created by Louis Teilliais on 07/02/2025.
//

import SwiftUI

import SwiftUI

struct UnlockDateSelectorComponent: View {
    @Binding var selectedDate: Date // La date sélectionnée par l'utilisateur
    var minimumDate: Date? = nil // Date minimale autorisée
    var maximumDate: Date? = nil // Date maximale autorisée
    var title: String = "Sélectionner une date" // Titre du sélecteur

    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .padding(.bottom, 10)
            
            DatePicker(
                "",
                selection: $selectedDate,
                in: (minimumDate ?? .distantPast)...(maximumDate ?? .distantFuture),
                displayedComponents: [.date]
            )
            .datePickerStyle(GraphicalDatePickerStyle()) // Style graphique
            .labelsHidden() // Cache le label par défaut du sélecteur

            Text("Date sélectionnée : \(formattedDate(selectedDate))")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.top, 10)
        }
        .padding()
        .background(Color(UIColor.systemGray6))
        .cornerRadius(10)
        .shadow(radius: 5)
    }

    // Formatte la date pour l'afficher sous forme lisible
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
}
