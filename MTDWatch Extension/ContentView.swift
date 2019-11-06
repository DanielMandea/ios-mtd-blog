//
//  ContentView.swift
//  MTDWatch Extension
//
//  Created by Daniel Mandea on 15/10/2019.
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
        List {
            blogPostItems
        }
    }
}

// MARK: - blogPostItems

private extension ContentView {
    var blogPostItems: some View {
        Section {
            ForEach(viewModel.dataSource) { blogPost in
                BlogPostRow(blogPost: blogPost)
            }
        }
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let blogPostService = DefaultBlogPostService(configuration: DefaultServiceConfiguration(baseUrl: Constants.Api.Blog.url))
        return ContentView(viewModel: ListViewModel(blogPostService: blogPostService))
    }
}
