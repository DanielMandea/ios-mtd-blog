//
//  BlogPostImage.swift
//  MTDBlog
//
//  Created by Daniel Mandea on 02/10/2019.
//  Copyright © 2019 IBM. All rights reserved.
//

import Foundation
import SwiftUI

struct BlogPostImage : View {
    
    // MARK: - Private
    
    private var image: Image
    
    // MARK: - Init
    
    init(image: Image) {
        self.image = image
    }
    
    // MARK: - Body
    
    var body: some View {
        image
            .resizable()
            .clipped()
            .aspectRatio(contentMode: .fill)
    }
}
