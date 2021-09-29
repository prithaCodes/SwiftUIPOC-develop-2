//
//  ExtendedDivider.swift
//  GQPOC
//
//  Created by Aqeel Bhat on 28/09/21.
//

import SwiftUI

struct ExtendedDivider: View {
    var color: Color = .gray
    var thinckness: CGFloat = 2
    
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: thinckness)
            .edgesIgnoringSafeArea(.horizontal)
    }
}

struct ExtendedDivider_Previews: PreviewProvider {
    static var previews: some View {
        ExtendedDivider(color: .red, thinckness: 20)
    }
}
