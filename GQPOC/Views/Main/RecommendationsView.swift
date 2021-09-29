//
//  RecommendationsView.swift
//  GQPOC
//
//  Created by Khasnobis, Pritha on 29/09/21.
//

import SwiftUI

struct RecommendationsView: View {
    
    @State var showModal = false
    
    var body: some View {
        VStack {
            Section(
                title: "Recommendations",
                subtitle: "28 August 2021, London",
                disclosureImageUrl: "cloud.sun",
                disclosureText: "21°C",
                backgroundColor: .clear
            )
            .padding(.leading, 26)
            .padding(.top, 16)
            
            Staggered(
                columns: 2,
                showsScrollIndicators: true,
                spacing: 10,
                list: [
                    Post(urlString: "item0"),
                    Post(urlString: "item1"),
                    Post(urlString: "item2"),
                    Post(urlString: "item5"),
                    Post(urlString: "item4"),
                    Post(urlString: "item3")
                ]
            )
            { post in
                ImageViewCard(post: post)
                    .onTapGesture {
                        print(post.urlString)
                        showModal = true
                    }
                    .sheet(isPresented: $showModal) {
                        ItemDetailView(
                            showModal: self.$showModal,
                            title: "Ten C Fishtail Parka",
                            subtitle: "TEN-C’s Parka, the most iconic Ten C garment",
                            price: "£800",
                            source: "endclothing.com",
                            desciptionTitle: "A modern twist on a classic piece",
                            description: "Parka’s offer an improved weather protection compared to Field Jackets and turned into subcultural fashion statements during the 1960s. The M-51 parka turned into a cult item for Mods and the uprising youth of the 1970s and 1980s. TEN-C’s version features a loose silhouette with a longer fishtail back and of course adapts well to variations in temperature."
                        )
                }
            }
        }
        .padding(.top, 16)
        .background(Color.background)
        .edgesIgnoringSafeArea(.all)
    }
}

struct RecommendationsView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationsView()
    }
}
