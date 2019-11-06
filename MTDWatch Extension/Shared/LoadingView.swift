//
//  LoadingView.swift
//  MTDWatch Extension
//
//  Created by Daniel Mandea on 15/10/2019.
//  Copyright © 2019 IBM. All rights reserved.
//

import Foundation
import SwiftUI

struct LoadingView: View {

    @Binding var isShowing: Bool
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                VStack {
                    Text("Loading ...")
                }
                .frame(width: geometry.size.width,
                       height: geometry.size.height)
                .background(Color.secondary.colorInvert())
                .foregroundColor(Color.primary)
                .opacity(self.isShowing ? 1 : 0)
            }
        }
    }

}
