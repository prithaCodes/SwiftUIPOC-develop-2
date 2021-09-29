//
//  Carousel.swift
//  GQPOC
//
//  Created by Aqeel Bhat on 31/08/21.
//

import SwiftUI

struct Carousel: View {
    
    @State private var index = 0
    
    var images: [String]
    var title: String
    var subtitle: String
    var shouldRenderChevron: Bool
    var symbolName: String?
    var shouldHidePager: Bool
    var gradientColors: [Color]
    var contentForegroundColor: Color
    
    var body: some View {
        let yExtension: CGFloat = 50
        
        GeometryReader { metrics in
            ZStack(alignment: .center) {
                TabView(selection: $index) {
                    ForEach(0...images.capacity - 1, id: \.self) { image in
                        ZStack (alignment: .bottom) {
                            Image(images[image])
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipped()
                            gradientView
                            VStack {
                                VStack(alignment: .center, spacing: 16, content: {
                                    titleView
                                    subtitleView
                                    if shouldRenderChevron { chevronImageView }
                                })
                                .padding(EdgeInsets(top: 0, leading: 16, bottom: 64, trailing: 16))
                            }
                        }
                    }
                }
                .frame(width: metrics.size.width, height: metrics.size.height + yExtension)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                if !shouldHidePager && images.capacity > 1 { pagerView }
            }
        }
        .offset(y: -yExtension)
        .edgesIgnoringSafeArea(.all)
    }
    
    private var titleView: some View {
        Text(self.title.uppercased())
            .font(.custom("GTWalsheimPro-Black", size: 66))
            .foregroundColor(contentForegroundColor)
            .multilineTextAlignment(.center)
    }
    
    private var subtitleView: some View {
        Text(self.subtitle)
            .fontWeight(.thin)
            .font(.custom("GTWalsheimPro-Regular", size: 24))
            .foregroundColor(contentForegroundColor)
            .multilineTextAlignment(.center)
    }
    
    private var chevronImageView: some View {
        Image(systemName: symbolName ?? "exclamationmark.shield.fill")
            .resizable()
            .renderingMode(.template)
            .foregroundColor(contentForegroundColor)
            .frame(width: 38, height: 38, alignment: .center)
    }
    
    private var pagerView: some View {
        HStack(spacing: 13) {
            ForEach(0...images.capacity - 1, id: \.self) { index in
                if index == self.index {
                    Circle()
                        .fill(contentForegroundColor)
                        .frame(width: 6, height: 6)
                } else {
                    Circle()
                        .stroke(contentForegroundColor)
                        .frame(width: 6, height: 6)
                }
                
            }
        }
    }
    
    private var gradientView: some View {
        Rectangle()
            .foregroundColor(.clear)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(
                LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .top, endPoint: .bottom)
            )
    }
    
}

struct Carousel_Previews: PreviewProvider {
    static var previews: some View {
        Carousel(
            images: ["0", "1", "2"],
            title: "Editors Picks",
            subtitle: "Our editors best style and fashion recommendations for any budget",
            shouldRenderChevron: true,
            shouldHidePager: false,
            gradientColors: [.clear, .black],
            contentForegroundColor: .white
        )
    }
}
