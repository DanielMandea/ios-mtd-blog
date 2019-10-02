//
//  BlogPostIdentifiable.swift
//  MTDBlog
//
//  Created by Daniel Mandea on 29/09/2019.
//  Copyright © 2019 IBM. All rights reserved.
//

import Foundation
import MTDBlogComponents

extension BlogPost: Identifiable {
    public var id: String {
        return uniqueID
    }
}
