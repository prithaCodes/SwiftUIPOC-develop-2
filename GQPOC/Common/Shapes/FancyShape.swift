//
//  FancyCorner.swift
//  GQPOC
//
//  Created by Aqeel Bhat on 09/09/21.
//

import SwiftUI

struct FancyShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX / 1.20, y: rect.minY))
        
        return path
    }
}

struct FancyCorner: View {
    var height: CGFloat
    var width: CGFloat
    var color: Color
    
    var body: some View {
        FancyShape()
            .frame(width: width, height: height)
            .foregroundColor(color)
    }
}

struct FancyCorner_Previews: PreviewProvider {
    static var previews: some View {
        FancyCorner(
            height: 20,
            width: 120,
            color: .red
        )
    }
}
