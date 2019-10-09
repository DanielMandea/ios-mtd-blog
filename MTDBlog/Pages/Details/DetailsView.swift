//
//  DetailsView.swift
//  MTDBlog
//
//  Created by Daniel Mandea on 07/10/2019.
//  Copyright © 2019 IBM. All rights reserved.
//

import Foundation
import SwiftUI

struct DetailsView: View {
    @State private var enableLogging = false

    @State private var selectedColor = 0
    @State private var colors = ["Red", "Green", "Blue"]
    
    @State private var showingAdvancedOptions = false

    var body: some View {
        NavigationView {
            Form {
                Text("Hello World")
            }.navigationBarTitle("Settings")
        }
    }
}

// MARK: - blogPostItems

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        return DetailsView()
    }
}

