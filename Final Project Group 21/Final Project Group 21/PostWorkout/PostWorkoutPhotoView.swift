//
//  PostWorkoutPhotoView.swift
//  Final Project Group 21
//
//  Created by Comus Hardman IV on 11/30/24.
//


import SwiftUI
import UIKit

struct PostWorkoutPhotoView: View {
    @State private var isShowingCamera = false
    @State private var selectedImage: UIImage? = nil

    var body: some View {
        VStack {
            Text("Postworkout photo")
                .font(.largeTitle)
                .padding()

            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 300)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            } else {
                Text("No photos tkaen. Take one below")
                    .foregroundColor(.gray)
            }

            Button(action: {
                isShowingCamera = true
            }) {
                Text("Take a photo")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

            Spacer()
        }
        .sheet(isPresented: $isShowingCamera) {
            CameraView(image: $selectedImage)
        }
    }
}
