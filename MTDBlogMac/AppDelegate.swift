//
//  AppDelegate.swift
//  MTDBlogMac
//
//  Created by Daniel Mandea on 18/09/2019.
//  Copyright © 2019 IBM. All rights reserved.
//

import Cocoa
import SwiftUI
import MTDBlogRequests


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        window.center()
        window.setFrameAutosaveName("Main Window")

        let blogPostService = DefaultBlogPostService(configuration: DefaultServiceConfiguration(baseUrl: Constants.Api.Blog.url))
        let viewModel = ListViewModel(blogPostService: blogPostService)
        window.contentView = NSHostingView(rootView: ContentView(viewModel: viewModel))

        window.makeKeyAndOrderFront(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

