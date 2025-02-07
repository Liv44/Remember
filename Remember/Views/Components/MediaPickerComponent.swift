//
//  MediaPickerComponent.swift
//  Remember
//
//  Created by Louis Teilliais on 07/02/2025.
//

import Foundation
import SwiftUI
import PhotosUI

struct MediaPickerComponent: View {
    @State private var pickerItems: [PhotosPickerItem] = [] // Items sélectionnés

    var body : some View {
        
        PhotosPicker(
            selection: $pickerItems,
            maxSelectionCount: 5,
            matching: .any(of: [.images, .videos])
        ) {
            Text("Sélectionner des médias")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(radius: 5)
        }
            
    }
}
