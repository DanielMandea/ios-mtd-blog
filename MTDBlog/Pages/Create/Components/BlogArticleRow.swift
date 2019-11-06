//
//  BlogArticleRow.swift
//  MTDBlog
//
//  Created by Daniel Mandea on 06/11/2019.
//  Copyright © 2019 IBM. All rights reserved.
//

import Foundation
import SwiftUI

struct BlogArticleRow: View  {
    
    @ObservedObject var viewModel: ArticleRowModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Title:")
                TextField("Please enter a title", text: $viewModel.title)
            }
            HStack {
                Text("Subtitle:")
                TextField("Please enter a subtitle", text: $viewModel.subtitle)
            }
        }
    }
}
