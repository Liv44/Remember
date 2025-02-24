//
//  ContentView.swift
//  Remember
//
//  Created by Olivia Moreau on 17/01/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            CapsuleListView()
                .tabItem{
                    Label("Liste", systemImage: "list.bullet")
                }
            CreateCapsuleView()
                .tabItem {
                    Label("Créer", systemImage: "plus.circle")
                }
            ProfileView()
                .tabItem {
                    Label("Profil", systemImage: "person.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
