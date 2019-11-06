//
//  BlogArticleIdentifiable.swift
//  MTDBlog
//
//  Created by Daniel Mandea on 06/11/2019.
//  Copyright © 2019 IBM. All rights reserved.
//

import Foundation
import MTDBlogComponents

extension BlogArticle: Identifiable {
    public var id: String {
        return uniqueID
    }
}
