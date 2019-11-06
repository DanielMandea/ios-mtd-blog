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
import BaseService

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
                blogPostHeaderView
                blogPostArticlesList
                    .navigationBarItems(trailing:
                        HStack {
                            Spacer()
                            submitBarButtonItem
                            Spacer()
                        }
                )
                    .navigationBarTitle("New Blog Post")
                    .sheet(isPresented: $isGalleryPresented,
                           content: { ImagePickerView(isShown: self.$isGalleryPresented, image: self.$image, imageData: self.$viewModel.imageData) })
            }
        }
    }
}


// MARK: - Extensions

private extension CreateView {
    var blogPostArticlesList: some View {
        VStack {
            HStack {
                Spacer()
                addArticleButton
                Spacer()
            }
            List {
                Section {
                    ForEach(viewModel.dataSource) { model in
                        BlogArticleRow(viewModel: model)
                    }
                }
            }
        }
    }
}

private extension CreateView {
    var blogPostHeaderView: some View {
        Section {
            VStack {
                HStack {
                    Text("Create ")
                    Spacer()
                    Button(action: {
                        self.isGalleryPresented.toggle()
                    }) {
                        Image(systemName: "camera")
                            .imageScale(.large)
                    }.frame(height: 50, alignment: .center)
                }
                HStack {
                    Text("Title:")
                        .frame(height: 50, alignment: .top)
                    TextField("Please enter a title", text: $viewModel.title)
                        .frame(height: 50, alignment: .top)
                }
                HStack {
                    Text("Subtitle:")
                        .frame(height: 50, alignment: .top)
                    TextField("Please enter a subtitle", text: $viewModel.subtitle)
                        .frame(height: 50, alignment: .top)
                }
                image?.resizable()
                    .frame(height: 200, alignment: .top)
                    .scaledToFit()
            }
        }
    }
}

private extension CreateView {
    var submitBarButtonItem: some View {
        Button(action: {
            _ = self.viewModel.upload()
            self.isShown?.wrappedValue = false
        }) {
            Image(systemName: "icloud.and.arrow.up")
                .imageScale(.large)
            
        }.frame(height: 50, alignment: .center)
    }
}

private extension CreateView {
    var addArticleButton: some View {
        Button(action: {
            self.viewModel.addArticle()
        }) {
            Text("Add Article")
        }.frame(height: 50, alignment: .center)
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
