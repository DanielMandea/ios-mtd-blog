//
//  ArticleRowModel.swift
//  MTDBlog
//
//  Created by Daniel Mandea on 06/11/2019.
//  Copyright © 2019 IBM. All rights reserved.
//

import Foundation
import MTDBlogComponents

class ArticleRowModel: ObservableObject, Identifiable {
    
    var id: String {
        return NSUUID().uuidString
    }
    
    // MARK: - Published
    
    @Published var title: String = ""
    @Published var subtitle: String = ""
    
    var article: BlogArticle {
        return BlogArticle(title: title, content: subtitle, images: nil)
    }
}
