//
//  CreateView.swift
//  MTDBlog
//
//  Created by Daniel Mandea on 01/10/2019.
//  Copyright © 2019 IBM. All rights reserved.
//

import SwiftUI
import MTDBlogRequests
import MTDBlogComponents

struct CreateView: View {
    
    // MARK: - ObservedObject
    
    @ObservedObject var viewModel: CreateViewModel
    
    // MARK: - State
    
    @State private var isModelPresented = false
    @State var showImagePicker: Bool = false
    @State var title: String = "Title Mock"
    @State var subtitle: String = "Title Mock"
    @State var image: Image?
    @State var imageData: Data?
    
    // MARK: - Init
    
    init(viewModel: CreateViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Spacer()
                TextField("Please enter a title", text: $title)
                    .frame(width: 300, height: 30, alignment: .top)
                    .padding(.leading, 8)
                    .padding(.trailing, 8)
                    .padding(.bottom, 8)
                    .border(Color.black, width: 2)
                    .clipped()
                
                TextField("Please enter a subtitle", text: $subtitle)
                    .frame(width: 300, height: 30, alignment: .top)
                    .padding(.leading, 8)
                    .padding(.trailing, 8)
                    .padding(.bottom, 8)
                    .border(Color.black, width: 2)
                    .clipped()
                Spacer()
                Button(action: {
                    withAnimation {
                        self.showImagePicker.toggle()
                    }
                }) {
                    Text("Show image picker")
                }
                Spacer()
                Button(action: {
                    _ = self.viewModel.load(for: self.title, subtitle: self.subtitle, data: self.imageData ?? Data())
                }) {
                    Text("Upload Images")
                }
                Spacer()
            }
            .frame(width: 350, height: 300, alignment: .top)
            .border(Color.black, width: 2)
            Spacer()
            image?.resizable()
            if (showImagePicker) {
                ImagePickerView(isShown: $showImagePicker, image: $image, imageData: $imageData)
            }
             Spacer()
        }
    }
    
}

// MARK: - blogPostItems


struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        let blogPostService = DefaultBlogPostService(configuration: DefaultServiceConfiguration(baseUrl: Constants.Api.Blog.url))
        let createViewModel = CreateViewModel(blogPostService: blogPostService)
        return CreateView(viewModel: createViewModel)
    }
}
