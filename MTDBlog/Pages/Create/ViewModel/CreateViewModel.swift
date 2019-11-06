//
//  CreateViewModel.swift
//  MTDBlog
//
//  Created by Daniel Mandea on 02/10/2019.
//  Copyright © 2019 IBM. All rights reserved.
//

import Foundation
import Combine
import MTDBlogRequests
import MTDBlogComponents

class CreateViewModel: ObservableObject {
    
    // MARK: - Published
    
    @Published var success: Bool = false
    @Published var title: String = ""
    @Published var subtitle: String = ""
    @Published var imageData: Data?
    @Published var dataSource: [ArticleRowModel] = [ArticleRowModel]()
    
    // MARK: - Private
    
    private let blogPostService: BlogPostService
    
    // MARK: - Init
    
    init(blogPostService: BlogPostService) {
        self.blogPostService = blogPostService
    }

    // MARK: - Load
    
    func upload() -> AnyCancellable? {
        let articles = dataSource.map { $0.article }
        let blogPost = BlogPost(title: title, subtitle: subtitle, articles: articles)
        guard let data = imageData else { return nil }
        return blogPostService.upload(blogPost: blogPost, with: data)
            .receive(on: RunLoop.main)
            .tryMap { output in
                return output.thumbnailImageUrl != nil 
        }
        .replaceError(with: false)
        .subscribe(on: RunLoop.main)
        .assign(to: \.success, on: self)
    }
    
    func addArticle() {
        dataSource.append(ArticleRowModel())
    }
}
