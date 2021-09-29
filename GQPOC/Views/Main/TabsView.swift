//
//  TabsView.swift
//  GQPOC
//
//  Created by Khasnobis, Pritha on 28/09/21.
//

import SwiftUI

struct TabsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    init() {
        UITabBar.appearance().barTintColor = UIColor.black
    }
    
    var body: some View {
        TabView {
            MainView(selection: 0)
                .tabItem {
                    Label("What to Wear", systemImage: "cube.box")
                }
                .tag(1)
            RecommendationsView()
                .tabItem {
                    Label("Recommendations", systemImage: "arrowshape.turn.up.right")
                }
                .tag(2)
            Text("Saved Items")
                .padding()
                .tabItem {
                    Label("Saved Items", systemImage: "heart")
                }
                .tag(3)
            Text("My GQ")
                .padding()
                .tabItem {
                    Label("My GQ", systemImage: "person.circle")
                }
                .tag(4)
        }
        .edgesIgnoringSafeArea([.top, .bottom])
        .accentColor(.tabTint)
    }
}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
    }
}
