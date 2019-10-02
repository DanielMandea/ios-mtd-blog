//
//  ImagePickerView.swift
//  MTDBlog
//
//  Created by Daniel Mandea on 02/10/2019.
//  Copyright © 2019 IBM. All rights reserved.
//

import SwiftUI
import UIKit

struct ImagePickerView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIImagePickerController
    
    
    let isShown: Binding<Bool>
    let image: Binding<Image?>
    let imageData: Binding<Data?>
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        let isShown: Binding<Bool>
        let image: Binding<Image?>
        let imageData: Binding<Data?>
        
        init(isShown: Binding<Bool>, image: Binding<Image?>, imageData: Binding<Data?>) {
            self.isShown = isShown
            self.image = image
            self.imageData = imageData
        }
        
        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
            self.image.wrappedValue = Image(uiImage: uiImage)
            self.imageData.wrappedValue = uiImage.jpegData(compressionQuality: 0.2)
            self.isShown.wrappedValue = false
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            isShown.wrappedValue = false
        }
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(isShown: isShown, image: image, imageData: imageData)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>) -> UIImagePickerController {
        let picker = UIImagePickerController()
               picker.delegate = context.coordinator
               return picker
    }
    

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePickerView>) {
        
    }
    
}
