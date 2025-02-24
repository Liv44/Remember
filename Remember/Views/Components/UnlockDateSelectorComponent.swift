//
//  UnlockDateSelectorComponent.swift
//  Remember
//
//  Created by Louis Teilliais on 07/02/2025.
//

import SwiftUI

import SwiftUI

struct UnlockDateSelectorComponent: View {
    @Binding var selectedDate: Date
    var minimumDate: Date? = nil
    var maximumDate: Date? = nil
    var title: String = "Sélectionner une date"
    
    @State private var isShowingModal: Bool = false


    var body: some View {
        
        Button(action: {
            isShowingModal.toggle()
        }) {
            HStack {
                Text(formattedDate(selectedDate)) // Date affichée
                    .foregroundColor(.primary)
                Spacer()
                Image(systemName: "calendar")
                    .foregroundColor(.primary)
            }
            .padding()
            .background(Color(UIColor.systemGray6))
            .cornerRadius(8)
            .shadow(radius: 1)
        }.sheet(isPresented: $isShowingModal) {
            NavigationView {
                    VStack {
                        DatePicker(
                            "",
                            selection: $selectedDate,
                            in: (minimumDate ?? .distantPast)...(maximumDate ?? .distantFuture),
                            displayedComponents: [.date]
                        )
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .labelsHidden()
                        .padding()

                        Spacer()

                        Button(action: {
                            isShowingModal = false
                        }) {
                            Text("Valider")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .cornerRadius(10)
                                .shadow(radius: 2)
                        }
                        .padding()
                    }
                    .navigationTitle(title)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Annuler") {
                                isShowingModal = false
                            }
                        }
                    }
                }
        }
        
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
}
