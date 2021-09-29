//
//  FancyContentCard.swift
//  GQPOC
//
//  Created by Aqeel Bhat on 06/09/21.
//

import SwiftUI

struct FancyContentCard: View {
    
    var imageUrl: String
    var category: String
    var title: String
    var subtitle: String
    var backgroundColor: Color
    var foregroundColor: Color
    var fancyCornerBgColor: Color
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
           // imageView
            AsyncImage(
                url: URL(string: imageUrl)!,
                placeholder: { LoaderView() },
               image: { Image(uiImage: $0).resizable() }
            )
            .frame( maxWidth: .infinity)
            .aspectRatio(contentMode: .fit)
            .clipped()
            
            contentView
        }
    }
    
    var imageView: some View {
        Image(imageUrl)
            .resizable()
            .frame(maxWidth: .infinity)
            .aspectRatio(contentMode: .fit)
            .clipped()
    }
    
    private var contentView: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            VStack(alignment: .leading, spacing: 16) {
                titleView
                subtitleView
            }
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                alignment: .topLeading
            )
            .padding()
            .background(backgroundColor)
            categoryView
                .offset(x: 0, y: -10)
        }
    }
    
    private var categoryView: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            FancyCorner(
                height: 30,
                width: 120,
                color: fancyCornerBgColor
            )
            Text(category.uppercased())
                .walshiemFont(
                    style: .caption2, weight: .regular,
                    size: 18, color: foregroundColor
                )
                .padding()
        }
        .frame(width: 120, height: 20, alignment: .center)
    }
    
    private var titleView: some View {
        Text(title)
            .walshiemFont(
                style: .title1, weight: .heavy,
                size: 28, color: foregroundColor
            )
            .padding(.top, 16)
    }
    
    private var subtitleView: some View {
        Text(subtitle)
            .walshiemFont(
                style: .caption2, weight: .regular,
                size: 18, color: foregroundColor
            )
    }
}

struct FancyContentCard_Previews: PreviewProvider {
    static var previews: some View {
        FancyContentCard(
            imageUrl: "https://assets.gqindia.com/photos/610e4abe4a83577ac4e8220c/master/w_1600,c_limit/060821_justin_and_hailey_01.jpg",
            category: "Fashion",
            title: "Justin Bieber is the boss of big and billowing looks",
            subtitle: "By Zak Maoui",
            backgroundColor: .white,
            foregroundColor: .black,
            fancyCornerBgColor: .orange
        )
        
        FancyContentCard(
            imageUrl: "7",
            category: "Fashion",
            title: "Best jeans for men: from skinny fit to wide leg",
            subtitle: "By Bemi Shaw",
            backgroundColor: .white,
            foregroundColor: .black,
            fancyCornerBgColor: .white
        )
        
        FancyContentCard(
            imageUrl: "6",
            category: "Style",
            title: "The Shades You Need: Best Sunglasses of 2021",
            subtitle: "By Aaron Toumazou",
            backgroundColor: .white,
            foregroundColor:  .black,
            fancyCornerBgColor: .white
        )
        
        FancyContentCard(
            imageUrl: "9",
            category: "Fashion",
            title: "Skinny jeans are officially over – just ask Travis Scott",
            subtitle: "By Zak Maoui",
            backgroundColor: .black,
            foregroundColor: .white,
            fancyCornerBgColor: .black
        )
        
        FancyContentCard(
            imageUrl: "10",
            category: "Fashion",
            title: "Sebastian Stan has one of the most replicable styles on the planet",
            subtitle: "By Zak Maoui",
            backgroundColor: .black,
            foregroundColor: .white,
            fancyCornerBgColor: .black
        )
        
    }
}
