//
//  ProfileView.swift
//  Remember
//
//  Created by Louis Teilliais on 07/02/2025.
//

import SwiftUICore
import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var userController: UserController
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Bienvenue sur votre profil")
                    .font(.title)
                Spacer()
                Text("Nom d'utilisateur : " + userController.users[0].username)
                Text("Email : " + userController.users[0].email)
                Spacer()
            }
            .padding()
            .navigationTitle("Profil Utilisateur")
        }
    }
}
