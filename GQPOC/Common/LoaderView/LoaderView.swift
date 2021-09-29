//
//  LoaderView.swift
//  GQPOC
//
//  Created by Khasnobis, Pritha on 29/09/21.
//

import SwiftUI

struct LoaderView: View {
    
    var tintColor: Color = .black
    var scaleSize: CGFloat = 1.0
    
    var body: some View {
        ProgressView()
            .scaleEffect(scaleSize, anchor: .center)
            .progressViewStyle(CircularProgressViewStyle(tint: tintColor))
    }
}
