//
//  ListeCapsulesView.swift
//  Remember
//
//  Created by Louis Teilliais on 07/02/2025.
//


import SwiftUI

struct CapsuleListView: View {
    @EnvironmentObject var capsuleController: CapsuleController
    var lockedCapsules: [Capsule] {
        capsuleController.capsules.filter { $0.isLocked }
    }

    var openedCapsules: [Capsule] {
        capsuleController.capsules.filter { !$0.isLocked }
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                VStack(alignment: .leading, spacing: 0){
                    Text("Capsules Ouvertes (\(openedCapsules.count))")
                        .fontWeight(Font.Weight.semibold)
                        .fontDesign(Font.Design.rounded)
                        .font(.system(size: 20))
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(openedCapsules, id: \.id) { capsule in
                                CardCapsuleListComponent(capsule: capsule)
                            }
                        }
                    }
                    Spacer(minLength:20)
                }

                VStack(alignment: .leading, spacing: 0){
                    Text("Capsules Fermées (\(lockedCapsules.count))")
                        .fontWeight(Font.Weight.semibold)
                        .fontDesign(Font.Design.rounded)
                        .font(.system(size: 20))
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(lockedCapsules, id: \.id) { capsule in
                                CardCapsuleListComponent(capsule: capsule)
                            }
                        }
                    }
                    Spacer(minLength: 20)
                }
                Spacer(minLength: 50)
            }.padding()
            .navigationTitle("Liste des Capsules")
        }
    }

}

#Preview {
    let capsuleController = CapsuleController(capsules: [
        Capsule(
            id: UUID(),
            title: "Paris 2024",
            description: "Description de la capsule 1",
            creationDate: Date(),
            unlockDate: Date().addingTimeInterval(86400), // 1 jour après
            medias: [
                Media(id: UUID(), url: "https://picsum.photos/1000/1000", type: .Image, image: nil),
                Media(id: UUID(), url: "https://picsum.photos/1000/1000", type: .Image, image: nil),
                Media(id: UUID(), url: "https://picsum.photos/1000/1000", type: .Image, image: nil)
            ],
            location: "Paris, France",
            isLocked: false
        ),
        Capsule(
            id: UUID(),
            title: "Paris 2024",
            description: "Description de la capsule 1",
            creationDate: Date(),
            unlockDate: Date().addingTimeInterval(86400), // 1 jour après
            medias: [
                Media(id: UUID(), url: "https://picsum.photos/1000/1000", type: .Image, image: nil),
                Media(id: UUID(), url: "https://picsum.photos/1000/1000", type: .Image, image: nil),
                Media(id: UUID(), url: "https://picsum.photos/1000/1000", type: .Image, image: nil)
            ],
            location: "Paris, France",
            isLocked: true
        )
    ])
    CapsuleListView().environmentObject(capsuleController)
}
