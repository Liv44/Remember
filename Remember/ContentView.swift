//
//  ContentView.swift
//  Remember
//
//  Created by Olivia Moreau on 17/01/2025.
//
import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            CapsuleListView()
                .tabItem {
                    Label("Liste", systemImage: "list.bullet")
                }
                .tag(0)

            CreateCapsuleView(onCapsuleCreated: {
                selectedTab = 0
            })
                .tabItem {
                    Label("Créer", systemImage: "plus.circle")
                }
                .tag(1)

            ProfileView()
                .tabItem {
                    Label("Profil", systemImage: "person.circle")
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

