//
//  ShoppingCard.swift
//  GQPOC
//
//  Created by Aqeel Bhat on 03/09/21.
//

import SwiftUI

struct ShoppingCard: View {
    
    var imageUrl: URL
    var title: String
    var source: String
    var price: String
    var cornerRadius: CGFloat
    var alignment: Alignment
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            AsyncImage(
               url: imageUrl,
                placeholder: { LoaderView() },
               image: { Image(uiImage: $0).resizable() }
            )
            .frame( maxWidth: .infinity) // 2:3 aspect ratio
            .aspectRatio(contentMode: .fit)
            .clipped()
            contentView
        }
        .background(Color.white)
        .cornerRadius(26)
        .frame(maxWidth: 185, maxHeight: 280)
    }
    
//    private var imageView: some View {
//
//        Image(imageUrl)
//            .resizable()
//            .frame(maxWidth: .infinity)
//            .aspectRatio(contentMode: .fit)
//            .clipped()
//    }
    
    private var contentView: some View {
        ZStack {
            VStack(spacing: 8) {
                titleView
                sourceView
                priceView
            }
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                alignment: .topLeading
            )
            .padding()
        }
    }
    
    private var titleView: some View {
        Text(title)
            .walshiemFont(
                style: .title1,
                weight: .bold,
                size: 18,
                color: .quat
            )
            .multilineTextAlignment(.center)
            .frame(
                maxWidth: .infinity,
                alignment: alignment
            )
    }
    
    private var sourceView: some View {
        Text(source)
            .walshiemFont(
                style: .caption1,
                weight: .regular,
                size: 14,
                color: .tert
            )
            .multilineTextAlignment(.center)
            .frame(
                maxWidth: .infinity,
                alignment: alignment
            )
    }
    
    private var priceView: some View {
        Text(price)
            .walshiemFont(
                style: .caption1,
                weight: .bold,
                size: 14,
                color: .secon
            )
            .multilineTextAlignment(.center)
            .frame(
                maxWidth: .infinity,
                alignment: alignment
            )
    }
}

struct ShoppingCard_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCard(
            imageUrl: URL(string: "hoodie")!,
            title: "CDLP Organic Cotton Hoodie",
            source: "cdlp.com",
            price: "£189",
            cornerRadius: 16,
            alignment: .center
        )
        
        ShoppingCard(
            imageUrl: URL(string: "jogger")!,
            title: "CDLP Organic Cotton Jogger",
            source: "cdlp.com",
            price: "£163",
            cornerRadius: 16,
            alignment: .center
        )
    }
}
