//
//  MainView.swift
//  GQPOC
//
//  Created by Aqeel Bhat on 31/08/21.
//

import SwiftUI

// Models
// TODO: Move to respective module

struct Article: Identifiable {
    var id: UUID
    var category: String
    var title: String
    var subtitle: String
}

struct stackItem: Identifiable {
    var id = UUID()
    var title: String
    var image: String
}

var stackItems: [stackItem] =
    [stackItem(title:"Trousers, Zara",
               image: "https://media.gqindia.com/wp-content/uploads/2020/04/ZARA-INR-4000.jpg"),
     stackItem(title:"Blue Solid Waistcoat, United Colors of Benetton",
               image:"https://media.gqindia.com/wp-content/uploads/2020/03/017.jpg"),
     stackItem(title:"Half Sleeve Shirt, Nicobar",
               image:"https://media.gqindia.com/wp-content/uploads/2020/03/02-11.jpg"),
     stackItem(title:"Shirt, Zara",
               image:"https://assets.gqindia.com/photos/6152e3d0dbbfda083a64942e/master/w_1600,c_limit/Hamid%2520Barkzi.png"),
     stackItem(title:"Milano silk and wool-blend suit",
               image:"https://media.gqindia.com/wp-content/uploads/2019/11/0413.jpg"),
     stackItem(title:"Ethnic wear 1",
               image:"https://assets.gqindia.com/photos/6152e20adbbfda083a649428/master/w_1600,c_limit/Arjun%2520Bijlani.png"),
     stackItem(title:"Ethnic wear 2",
               image:"https://assets.gqindia.com/photos/5fd31068cf6c00333454276f/master/w_1600,c_limit/Lewis%2520Hamilton.jpg"),
    ]
    
    
struct MainView: View {
    
    @State var posts: [Post] = []
    @State private var selectedIndex = 0
    @State private var selectedSubIndex = 1
    
    @State var showModal = false
    
    var selection = 0
    
    var category = [
        "New",
        "Office",
        "Casual",
        "Party",
        "Fitness",
        "New",
        "Office",
        "Casual",
        "Party",
        "Fitness"
    ]
    
    var subCategory = [
        "Humid",
        "Dry",
        "Hot",
        "Cold",
        "Rainy",
        "Snow"
    ]
    
    var articles: [Article] = []
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            PullToRefresh(coordinateSpaceName: "pullToRefresh") {
                // do your stuff when pulled
            }
            LazyVStack(alignment: .center, spacing: 16) {
                Section(
                    title: "What to wear?",
                    subtitle: "28 August 2021, London",
                    disclosureImageUrl: "cloud.sun",
                    disclosureText: "21°C",
                    backgroundColor: .clear
                )
                .padding(.leading, 26)
                .padding(.top, 10)
                
                VStack(alignment:.leading, spacing: 0) {
                    navigationView
                    categoryView
                }
                ContentCard(
                    category: "Music",
                    title: "Voices of the future : Griff to Polo G",
                    subtitle: "By GQ",
                    imageUrl: URL(string: "https://media.gq-magazine.co.uk/photos/61110a60ab26d1956f02cf47/master/w_1600,c_limit/global-music3.png"),
                    cornerRadius: 20,
                    alignment: .leading
                )
                .onTapGesture {
                    showModal = true
                }
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack(spacing: 16) {
                        ForEach(stackItems) { item in
                            ShoppingCard(
                                imageUrl:URL(string: item.image)!,
                                title:item.title,
                                source: "cdlp.com",
                                price: "£163",
                                cornerRadius: 16,
                                alignment: .center
                            ).onTapGesture {
                                showModal = true
                            }
                        }
                    }
                    .padding()
                })
                ContentCard(
                    category: "Fashion",
                    title: "The Bad Suit Is Now Very, Very Good",
                    subtitle: "By Zak Maoui",
                    imageUrl: URL(string: "https://media.gq.com/photos/61412824ff41c7fcfdc597a6/master/w_1600,c_limit/GettyImages-1340273606.jpg"),
                    cornerRadius: 30.0,
                    alignment: .leading
                )
                .onTapGesture {
                    showModal = true
                }
                Spacer()
                ContentCard(
                    category: "Music",
                    title: "Best wide-leg trousers for a Harry Styles-approved fit",
                    subtitle: "By Zak Maoui",
                    imageUrl: URL(string:"https://media.gqindia.com/wp-content/uploads/2020/04/inside10.jpg"),
                    cornerRadius: 20.0,
                    alignment: .center
                )
                .onTapGesture {
                    showModal = true
                }
                Section(
                    title: "How to Wear the Versatile  Military Parka Jacket",
                    subtitle: "Military Parka Outfits For Men",
                    disclosureImageUrl: nil,
                    disclosureText: nil,
                    backgroundColor: .clear
                )

                ForEach(1...2, id:\.self) { index in
                    FancyContentCard(
                        imageUrl: "https://assets.gqindia.com/photos/610e4abe4a83577ac4e8220c/master/w_1600,c_limit/060821_justin_and_hailey_01.jpg",
                        category: "Fashion",
                        title: "Justin Bieber is the boss of big and billowing looks",
                        subtitle: "By Zak Maoui",
                        backgroundColor: .white,
                        foregroundColor: .black,
                        fancyCornerBgColor: .white
                    )
                    .onTapGesture {
                        showModal = true
                    }
                }
            }
            .padding(.top, 16)
        }
        .coordinateSpace(name: "pullToRefresh")
        .background(Color.background)
        .edgesIgnoringSafeArea(.all)
        
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
    
    private var navigationView: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            SegmentedPicker(
                category,
                selectedIndex: Binding(
                    get: { selectedIndex },
                    set: { selectedIndex = $0 ?? 0 }),
                content: { item, isSelected in
                    Text(item)
                        .font(
                            Font.custom("GTWalsheimPro-Medium", size: 12)
                        )
                        .foregroundColor(Color.black)
                        .padding([.leading, .trailing], 24)
                        .padding([.top, .bottom], 8)
                },
                selection: {
                    VStack(spacing: 0) {
                        Spacer()
                        Rectangle()
                            .frame(height: 4)
                            .frame(width:30)
                    }
                })
                .animation(.easeIn(duration: 0.3))
        })
    }
    
    private var categoryView: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            SegmentedPicker(
                subCategory,
                selectedIndex: Binding(
                    get: { selectedSubIndex },
                    set: { selectedSubIndex = $0 ?? 0 }),
                content: { item, isSelected in
                    VStack {
                        Text(item)
                            .padding([.leading, .trailing], 24)
                            .padding([.top, .bottom], 4)
                            .foregroundColor(isSelected ? Color.white : Color.black )
                            .overlay(
                                RoundedRectangle(cornerRadius: 25.0)
                                    .stroke(lineWidth: 1.0)
                            )
                            .walshiemFont(style: .caption2, weight: .bold, size: 14, color: .prime)
                    }
                    .padding([.leading, .trailing], 12)
                    .padding([.top, .bottom], 8)
                },
                selection: {
                    Capsule()
                        .fill(Color.black)
                        .padding([.leading, .trailing], 12)
                        .padding([.top, .bottom], 8)
                    
                })
                .animation(.easeInOut(duration: 0.2))
            
        })
        .padding([.top], 16)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View { MainView() }
}



