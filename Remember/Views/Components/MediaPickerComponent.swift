//
//  MediaPickerComponent.swift
//  Remember
//
//  Created by Louis Teilliais on 07/02/2025.
//

import SwiftUI
import PhotosUI

struct MediaPickerComponent: View {
    @State private var pickerItems: [PhotosPickerItem] = []
    @State private var selectedImages: [UIImage] = []

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            PhotosPicker(
                selection: $pickerItems,
                maxSelectionCount: 5,
                matching: .any(of: [.images])
            ) {
                HStack {
                    Text("Sélectionner des médias")
                        .foregroundColor(.primary)
                    Spacer()
                    Image(systemName: "photo.on.rectangle.angled")
                        .foregroundColor(.primary)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(UIColor.systemGray6))
                .cornerRadius(8)
                .shadow(radius: 1)
            }
            .onChange(of: pickerItems) { // Nouvelle syntaxe avec une seule fermeture
                Task {
                    var images: [UIImage] = []
                    for item in pickerItems {
                        if let data = try? await item.loadTransferable(type: Data.self),
                           let image = UIImage(data: data) {
                            images.append(image)
                        }
                    }
                    selectedImages = images
                }
            }

            
            if !selectedImages.isEmpty {
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        ForEach(selectedImages, id: \.self) { image in
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                    }
                }
                .frame(height: 120)
            }
        }
        .padding()
    }
}
