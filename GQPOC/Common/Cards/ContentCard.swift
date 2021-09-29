//
//  ContentCard.swift
//  GQPOC
//
//  Created by Aqeel Bhat on 02/09/21.
//

import SwiftUI

struct ContentCard: View {
    
    var category: String
    var title: String
    var subtitle: String
    var imageUrl: URL?
    var cornerRadius: CGFloat = 30.0
    var alignment: Alignment = .leading
    var spacing: CGFloat = 16
    var padding: CGFloat = 32
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack {
            AsyncImage(
               url: imageUrl!,
                placeholder: {
                    LoaderView()
                },
               image: { Image(uiImage: $0).resizable() }
            )
            .clipped()
            .scaledToFit()
            .cornerRadius(cornerRadius)
            .shadow(radius: 16, y: 16)
            //.frame(idealHeight: UIScreen.main.bounds.width / 2 * 3)
            }
            
            VStack(spacing: spacing) {
                categoryView
                titleView
                subtitleView
            }
            .padding(padding)
        }
    }
    
    private var overlayView: some View {
        LinearGradient(
            gradient: Gradient(colors: [.black, .black.opacity(0.01)]),
            startPoint: .bottom,
            endPoint: .top
        )
            .cornerRadius(cornerRadius)
    }
    
    private var categoryView: some View {
        Text(category.uppercased())
            .walshiemFont(
                style: .footnote,
                weight: .medium,
                size: 14,
                color: .white
            )
            .frame(
                maxWidth: .infinity,
                alignment: alignment
            )
    }
    
    private var titleView: some View {
        Text(title)
            .walshiemFont(
                style: .title1,
                weight: .black,
                size: 24,
                color: .white
            )
            .multilineTextAlignment(
                alignment == .center ? .center : .leading
            )
            .frame(
                maxWidth: .infinity,
                alignment: alignment
            )
    }
    
    private var subtitleView: some View {
        Text(subtitle)
            .walshiemFont(
                style: .footnote,
                weight: .medium,
                size: 14,
                color: .white
            )
            .frame(
                maxWidth: .infinity,
                alignment: alignment
            )
    }
}

struct ContentCard_Previews: PreviewProvider {
    static var previews: some View {
        ContentCard(
            category: "Fashion",
            title: "Consider Michael Fassbender's tracksuit the blueprint for travelwear",
            subtitle: "By Zak Maoui",
            imageUrl: URL(string: "3"),
            cornerRadius: 30.0,
            alignment: .leading,
            spacing: 16,
            padding: 30
        )
        
        ContentCard(
            category: "Music",
            title: "Voices of the future : Griff to Polo G",
            subtitle: "By GQ",
            imageUrl: URL(string: "4"),
            cornerRadius: 0,
            alignment: .leading,
            spacing: 16,
            padding: 30
        )
        
        ContentCard(
            category: "Music",
            title: "Best wide-leg trousers for a Harry Styles-approved fit",
            subtitle: "By Zak Maoui",
            imageUrl: URL(string: "5"),
            cornerRadius: 30.0,
            alignment: .center,
            spacing: 16,
            padding: 30
        )
    }
}
