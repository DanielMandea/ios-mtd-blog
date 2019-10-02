//
//  ListViewModel.swift
//  MTDBlog
//
//  Created by Daniel Mandea on 28/09/2019.
//  Copyright © 2019 IBM. All rights reserved.
//

import Foundation
import Combine
import MTDBlogRequests
import MTDBlogComponents

class ListViewModel: ObservableObject {
    
    // MARK: - Published
    
    @Published var dataSource: [BlogPost] = [BlogPost]()
    
    // MARK: - Private
    
    private let blogPostService: BlogPostService
    
    // MARK: - Init
    
    init(blogPostService: BlogPostService) {
        self.blogPostService = blogPostService
    }
    
    // MARK: - Load 
    
    func load(for date: Date) -> AnyCancellable {
        return blogPostService.get(since: nil)
            .receive(on: RunLoop.main)
            .replaceError(with: [BlogPost]())
            .subscribe(on: RunLoop.main)
            .assign(to: \.dataSource, on: self)
    }
}
