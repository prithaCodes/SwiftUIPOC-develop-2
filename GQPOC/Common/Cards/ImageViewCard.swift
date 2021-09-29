//
//  ImageViewCard.swift
//  GQPOC
//
//  Created by Aqeel Bhat on 22/09/21.
//

import SwiftUI

struct ImageViewCard: View {
    var post: Post
    
    var body: some View {
        Image(post.urlString)
            .resizable()
            .scaledToFit()
            .cornerRadius(10)
    }
}

struct ImageViewCard_Previews: PreviewProvider {
    static var previews: some View {
        ImageViewCard(post: Post(urlString: "item0"))
    }
}

