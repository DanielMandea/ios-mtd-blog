//
//  HostingController.swift
//  MTDWatch Extension
//
//  Created by Daniel Mandea on 15/10/2019.
//  Copyright © 2019 IBM. All rights reserved.
//

import WatchKit
import Foundation
import SwiftUI
import MTDBlogRequests
import MTDBlogComponents
import BaseService

class HostingController: WKHostingController<ContentView> {
    override var body: ContentView {
        let blogPostService = DefaultBlogPostService(configuration: DefaultServiceConfiguration(baseUrl: Constants.Api.Blog.url))
        return ContentView(viewModel: ListViewModel(blogPostService: blogPostService))
    }
}
