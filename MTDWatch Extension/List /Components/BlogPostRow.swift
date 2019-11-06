//
//  BlogPostRow.swift
//  MTDWatch Extension
//
//  Created by Daniel Mandea on 15/10/2019.
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
        VStack(alignment: .leading) {
            imageView
            rowTitle
            rowSubtitle
            Spacer()
        }
        .frame(height: 200, alignment: .top)
        .padding(.leading, 8)
        .padding(.trailing, 8)
        .padding(.top, 8)
        .padding(.bottom, 8)
        .cornerRadius(20)
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
    var rowTitle: some View {
        Text("\(blogPost.title ?? "NO TITLE")")
        .fontWeight(.bold)
        .font(.title)
        .foregroundColor(Color.white)
    }
}

private extension BlogPostRow {
    var rowSubtitle: some View {
        Text("\(blogPost.subtitle ?? "NO SUBTITLE")")
        .fontWeight(.bold)
        .font(.subheadline)
        .foregroundColor(Color.white)
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
