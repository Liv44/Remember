//
//  ListeCapsulesView.swift
//  Remember
//
//  Created by Louis Teilliais on 07/02/2025.
//


import SwiftUI

struct CapsuleListView: View {
    @EnvironmentObject var capsuleController: CapsuleController
    
    var body: some View {
        NavigationView {
            List(capsuleController.capsules) { capsule in
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
