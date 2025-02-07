//
//  ListeCapsulesView.swift
//  Remember
//
//  Created by Louis Teilliais on 07/02/2025.
//


import SwiftUI

struct CapsuleListView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(1..<10) { index in
                    Text("Capsule \(index)")
                }
            }
            .navigationTitle("Liste des Capsules")
        }
    }
}
