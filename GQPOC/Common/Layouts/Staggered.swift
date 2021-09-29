//
//  Staggered.swift
//  GQPOC
//
//  Created by Aqeel Bhat on 21/09/21.
//

import SwiftUI

struct Post: Identifiable, Hashable { // TODO: Move to models
    var id = UUID().uuidString
    var urlString: String
}

struct Staggered<Content: View, T: Identifiable>: View where T: Hashable {
    
    var content: (T) -> Content
    var list: [T]
    var columns: Int
    var showsScrollIndicators: Bool
    var spacing: CGFloat
    
    init(columns: Int = 2,
         showsScrollIndicators: Bool = false,
         spacing: CGFloat = 10,
         list: [T],
         @ViewBuilder content: @escaping (T) -> Content) {
        self.content = content
        self.list = list
        self.showsScrollIndicators = showsScrollIndicators
        self.spacing = spacing
        self.columns = columns
    }
    
    func setup() -> [[T]] {
        var grid: [[T]] = Array(repeating: [], count: columns)
        var index = 0
        
        for item in list {
            grid[index].append(item)
            if index == columns - 1 { index = 0 } else {
                index += 1
            }
        }
        
        return grid
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: showsScrollIndicators) {
            HStack(alignment: .top) {
                ForEach(setup(), id:\.self) { item in
                    LazyVStack(spacing: spacing) {
                        ForEach(item, id:\.id) { column in
                            content(column)
                        }
                    }
                }
            }
            .padding(.vertical, 10)
        }
    }
}

struct Staggered_Previews: PreviewProvider {
    static var previews: some View {
        Staggered(
            columns: 2,
            showsScrollIndicators: true,
            spacing: 10,
            list: [
                Post(urlString: "item1"),
                Post(urlString: "item0"),
                Post(urlString: "item2"),
                Post(urlString: "item5"),
                Post(urlString: "item4"),
                Post(urlString: "item3")
            ]
        ) { post in
            ImageViewCard(post: post)
                .onTapGesture {
                    print(post.urlString)
                }
        }
        .padding(.horizontal)
    }
}
