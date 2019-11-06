//
//  BlogPostItem.swift
//  MTDBlog
//
//  Created by Daniel Mandea on 28/09/2019.
//  Copyright © 2019 IBM. All rights reserved.
//

import Foundation
import MTDBlogComponents
import SwiftUI
import RemoteImage

struct BlogPostRow: View {
    
    // MARK: - Private
    
    private let blogPost: BlogPost
    @State private var loading: Bool = true
    
    // MARK: - Init
    
    init(blogPost: BlogPost) {
        self.blogPost = blogPost
    }
    
    // MARK: - Body 
    
    var body: some View {
        VStack {
            imageView
            HStack {
                rowTextView
                .layoutPriority(100)
                Spacer()
            }
            .padding()
        }
        .frame(height: 300)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        )
            .padding([.top, .horizontal])
        
    }
}

// MARK: - Items

private extension BlogPostRow {
    var imageView: some View {
        let url = URL(string: blogPost.thumbnailImageUrl!)!
        return RemoteImage(url: url, errorView: { error in
            BlogPostImage(image: Image("functional_swift"))
        }, imageView: { image in
            BlogPostImage(image: image)
        }, loadingView: {
            LoadingView(isShowing: self.$loading)
        })
        
    }
}

private extension BlogPostRow {
    var rowTextView: some View {
        VStack(alignment: .leading) {
            Text("\(blogPost.title ?? "NO TITLE")")
                .font(.headline)
                .foregroundColor(.secondary)
            Text("\(blogPost.subtitle ?? "NO SUBTITLE")")
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(.primary)
                .lineLimit(3)
        }
    }
}

// MARK: - Previews

struct BlogPostRow_Previews: PreviewProvider {
    static var previews: some View {
        let blog = BlogPost(title: "Hello", subtitle: "Wolrd")
        blog.thumbnailImageUrl = AppConstants.Page.List.defaultURL.absoluteString
        return BlogPostRow(blogPost: blog)
    }
}
