//
//  Extensions.swift
//  GQPOC
//
//  Created by Aqeel Bhat on 24/09/21.
//

import SwiftUI

extension View {
    func walshiemFont(style: UIFont.TextStyle,
                      weight: Font.Weight,
                      size: CGFloat,
                      color: Color) -> some View {
        self.modifier(
            WalshiemFontModifier(
                style: style,
                weight: weight,
                size: size,
                color: color
            )
        )
    }
}
