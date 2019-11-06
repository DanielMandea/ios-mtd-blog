//
//  LoadingView.swift
//  MTDBlog
//
//  Created by Daniel Mandea on 13/10/2019.
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
                    ActivityIndicator(isAnimating: .constant(true), style: .large)
                }
                .frame(width: geometry.size.width,
                       height: 200)
                .background(Color.secondary.colorInvert())
                .foregroundColor(Color.primary)
                .opacity(self.isShowing ? 1 : 0)
            }
        }
    }

}
