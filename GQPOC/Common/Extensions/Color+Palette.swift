//
//  Color+Palette.swift
//  GQPOC
//
//  Created by Aqeel Bhat on 24/09/21.
//

import SwiftUI

extension Color {
    static var prime: Color {
        return Color(
            red: 000/255,
            green: 000/255,
            blue: 000/255
        )
    }
    static var secon: Color {
        return Color(
            red: 128/255,
            green: 128/255,
            blue: 128/255
        )
    }
    static var tert: Color {
        return Color(
            red: 165/255,
            green: 165/255,
            blue: 165/255
        )
    }
    static var quat: Color {
        return Color(
            red: 102/255,
            green: 102/255,
            blue: 102/255
        )
    }
    static var background: Color {
        return Color(red: 0.957, green: 0.957, blue: 0.957)
    }
    static var launchDominant: Color {
        return Color(red: 0.42, green: 0.37, blue: 0.75)
    }
    
    static var tabTint: Color {
        Color(red: 220/255, green: 237/255, blue: 79/255)
    }
}
