//
//  View.swift
//  GQPOC
//
//  Created by Aqeel Bhat on 24/09/21.
//

import SwiftUI

struct WalshiemFontModifier: ViewModifier {
    
    var style: UIFont.TextStyle = .title1
    var weight: Font.Weight = .heavy
    var size: CGFloat = 18
    var color: Color = .black
    
    func body(content: Content) -> some View {
        content
            .font(
                .custom(
                    Constants.FONT_FAMILY,
                    size: size
                )
                    .weight(weight)
            )
            .foregroundColor(color)
    }
    
}
