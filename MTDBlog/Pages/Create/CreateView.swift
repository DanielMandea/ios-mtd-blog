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
    
    @State private var image: Image?
    @State private var isGalleryPresented = false
    
    // MARK: - Internal
    
    var isShown: Binding<Bool>?
    
    // MARK: - Init
    
    init(viewModel: CreateViewModel, isShown: Binding<Bool>?) {
        self.viewModel = viewModel
        self.isShown = isShown
    }
    
    // MARK: - Body
    
    var body: some View {
        
        NavigationView {
            Form {
                Text("Hello Wolrd")
            }
        }
    }
}

// MARK: - Preview 

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        let blogPostService = DefaultBlogPostService(configuration: DefaultServiceConfiguration(baseUrl: Constants.Api.Blog.url))
        let createViewModel = CreateViewModel(blogPostService: blogPostService)
        return CreateView(viewModel: createViewModel, isShown: nil)
    }
}
