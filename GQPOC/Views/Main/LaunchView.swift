//
//  LaunchView.swift
//  GQPOC
//
//  Created by Aqeel Bhat on 28/09/21.
//

import SwiftUI

struct LaunchView: View {
    
    var items: [String] = [
        "Editors Picks",
        "What to Wear",
        "Your Collection"
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer().frame(height: 58)
                Section(
                    title: "Welcome back, John",
                    subtitle: "13 September 2021",
                    disclosureImageUrl: "cloud.sun",
                    disclosureText: "21°C",
                    backgroundColor: .clear
                )
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
                    Image("launch")
                        .resizable()
                        .clipped()
                        .scaledToFit()
                        .overlay(overlayView)
                    Group {
                        LazyVStack(spacing: 30) {
                            ForEach(items.indices, id: \.self) { index in
                                HStack {
                                    NavigationLink(destination: TabsView()) {
                                        Text(items[index])
                                            .walshiemFont(
                                                style: .title1,
                                                weight: .heavy,
                                                size: 24,
                                                color: .white
                                            )
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        ZStack {
                                            Circle()
                                                .fill(Color.launchDominant)
                                                .frame(width: 22, height: 22)
                                            Text(Int.random(in: 1 ..< 20).description)
                                                .walshiemFont(
                                                    style: .title1,
                                                    weight: .medium,
                                                    size: 14,
                                                    color: .white
                                                )
                                        }
                                    }
                                }
                                if index < items.count - 1 {
                                    ExtendedDivider(color: .white, thinckness: 3)
                                }
                            }
                        }
                        .padding([.top, .bottom], 5)
                    }
                    .padding()
                }
                Spacer()
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea([.top, .bottom])
            
        }.accentColor(.gray)
    }
    
    private var overlayView: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color.black, Color.black.opacity(0.2)]),
            startPoint: .bottom,
            endPoint: .top
        )
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
