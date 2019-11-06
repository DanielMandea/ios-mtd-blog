//
//  ContentView.swift
//  MTDBlog
//
//  Created by Daniel Mandea on 05/09/2019.
//  Copyright © 2019 IBM. All rights reserved.
//

import SwiftUI
import MTDBlogRequests
import MTDBlogComponents
import BaseService

struct ContentView: View {
    
    // MARK: - Observable
    
    @ObservedObject var viewModel: ListViewModel
    
    // MARK: - State
    
    @State private var isModelPresented = false
    
    // MARK: - Init
    
    init(viewModel: ListViewModel) {
        self.viewModel = viewModel
        _ = self.viewModel.load(for: Date())
    }
    
    // MARK: - Body 
    
    var body: some View {
        NavigationView {
            Form {
                List {
                    blogPostItems
                }
            }
            .listStyle(DefaultListStyle())
            .navigationBarTitle("MTD Blog 👨‍💻")
            .navigationBarItems(trailing:
                Button(action: {
                    self.isModelPresented = true
                }) {
                    Image(systemName: "square.and.pencil")
                        .imageScale(.large)
                        .padding()
                }
            ).sheet(isPresented: $isModelPresented,
                    content: { self.createContentView })
        }
    }
}

// MARK: - Extensions

private extension ContentView {
    var blogPostItems: some View {
        Section {
            ForEach(viewModel.dataSource) { blogPost in
               NavigationLink(destination: DetailsView()) {
                   BlogPostRow(blogPost: blogPost)
                }
            }
        }
    }
}

private extension ContentView {
    var createContentView: some View {
        let oauthService = DefaultOAuthService(configuration: DefaultServiceConfiguration(baseUrl: Constants.Api.OAuth.url))
        let imageService = DefaultImageService(oauth: oauthService, configuration: DefaultServiceConfiguration(baseUrl: Constants.Api.Image.url))
        let blogPostService = DefaultBlogPostService(configuration: DefaultServiceConfiguration(baseUrl: Constants.Api.Blog.url))
        blogPostService.imageService = imageService
        let viewModel = CreateViewModel(blogPostService: blogPostService)
        return CreateView(viewModel: viewModel, isShown: $isModelPresented)
    }
}

// MARK: - Preview 

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let blogPostService = DefaultBlogPostService(configuration: DefaultServiceConfiguration(baseUrl: Constants.Api.Blog.url))
        return ContentView(viewModel: ListViewModel(blogPostService: blogPostService))
    }
}
