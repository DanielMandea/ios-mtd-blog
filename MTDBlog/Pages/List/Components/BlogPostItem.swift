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
    
    // MARK: - Init
    
    init(blogPost: BlogPost) {
        self.blogPost = blogPost
    }
    
    // MARK: - Body 
    
    var body: some View {
        VStack(alignment: .leading) {
            imageView
            rowTitle
            rowSubtitle
            Spacer()
        }
//        .frame(height: 380, alignment: .top)
        .cornerRadius(20)
        .padding(.top, 20)
        .padding(.leading, 10)
        .padding(.trailing, 10)
        .padding(.bottom, 10)
        .shadow(radius: 10)
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
            BlogPostImage(image: Image("functional_swift"))
        })
    }
}

private extension BlogPostRow {
    var rowTitle: some View {
        Text("\(blogPost.title ?? "NO TITLE")")
        .fontWeight(.bold)
        .font(.title)
        .foregroundColor(Color.white)
        .padding(.leading, 8)
        .padding(.trailing, 8)
    }
}

private extension BlogPostRow {
    var rowSubtitle: some View {
        Text("\(blogPost.subtitle ?? "NO SUBTITLE")")
        .fontWeight(.bold)
        .font(.subheadline)
        .foregroundColor(Color.white)
        .padding(.leading, 8)
        .padding(.trailing, 8)
        .shadow(radius: 20)
        .clipped()
    }
}


struct BlogPostRow_Previews: PreviewProvider {
    static var previews: some View {
        let blog = BlogPost(title: "Hello", subtitle: "Wolrd")
        blog.thumbnailImageUrl = AppConstants.Page.List.defaultURL.absoluteString
        return BlogPostRow(blogPost: blog)
    }
}
