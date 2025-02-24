//
//  ProfileScreen.swift
//  Remember
//
//  Created by Louis Teilliais on 07/02/2025.
//

import SwiftUICore
import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Bienvenue sur votre profil")
                    .font(.title)
                Spacer()
                Text("Nom d'utilisateur : John Doe")
                Text("Email : john.doe@example.com")
                Spacer()
            }
            .padding()
            .navigationTitle("Profil Utilisateur")
        }
    }
}
