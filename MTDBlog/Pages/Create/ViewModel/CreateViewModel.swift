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
    
    // MARK: - Private
    
    private let blogPostService: BlogPostService
    
    // MARK: - Init
    
    init(blogPostService: BlogPostService) {
        self.blogPostService = blogPostService
    }
    
    static func validate(_ request: URLRequest, _ data: Data, _ response: URLResponse) throws -> Bool {
        guard let httpResponse = response as? HTTPURLResponse else { throw RequestError.invalidResponse }
        guard (200..<300).contains(httpResponse.statusCode) else { throw RequestError.statusCode(httpResponse.statusCode) }
        return true
    }
    
    
    // MARK: - Load
    
    func load(for title: String?, subtitle: String?, data: Data) -> AnyCancellable {
        let blogPost = BlogPost(title: title, subtitle: subtitle)
        return blogPostService.upload(blogPost: blogPost, with: data)
            .receive(on: RunLoop.main)
            .tryMap { output in
                return output.thumbnailImageUrl != nil 
        }
        .replaceError(with: false)
        .subscribe(on: RunLoop.main)
        .assign(to: \.success, on: self)
    }
}
