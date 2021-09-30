//
//  ItemDetailView.swift
//  GQPOC
//
//  Created by Aqeel Bhat on 27/09/21.
//

import SwiftUI

struct ItemDetailView: View {
    @Binding var showModal: Bool
    
    @State var items: [String] = []
    @State var selectedIndex = 0
    @State var showAlert = false
    @State var showActionSheet = false
    
    var title: String
    var subtitle: String
    var price: String
    
    var source: String
    
    var desciptionTitle: String
    var description: String
    
    var body: some View {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    imageView
                    thumbnailView
                    Group {
                        titleView
                        subtitleView
                        HStack {
                            priceView
                            sourceView
                        }
                    }
                    .padding(.leading)
                    .padding(.bottom, 1)
                    callToActionButton
                    secondaryActionButton
                    descriptionView
                }
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(.top)
    }
    
    var imageView: some View {
        Image("item\(selectedIndex)")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 400, alignment: .center)
            .clipped()
    }
    
    var thumbnailView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(0...5, id:\.self) { index in
                    Image("item\(index)")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .overlay(index == selectedIndex ?
                                 RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.prime, lineWidth: 5)
                                 : nil
                        )
                        .cornerRadius(10)
                        .padding(.leading, 10)
                        .onTapGesture {
                            withAnimation {
                                self.selectedIndex = index
                            }
                        }
                }
            }
        }
    }
    
    var titleView: some View {
        Text(title)
            .walshiemFont(style: .title1, weight: .heavy, size: 24, color: .prime)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
    }
    
    var subtitleView: some View {
        Text(subtitle)
            .walshiemFont(style: .caption1, weight: .regular, size: 14, color: .prime)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
    }
    
    var priceView: some View {
        Text(price)
            .walshiemFont(style: .caption1, weight: .regular, size: 16, color: .prime)
    }
    
    var sourceView: some View {
        Text(source)
            .walshiemFont(style: .caption1, weight: .thin, size: 16, color: Color.tert)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
    }
    
    var callToActionButton: some View {
        Button(action: {
            showActionSheet = true
        }) {
            Text("Buy Now")
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 30)
                .walshiemFont(style: .caption1, weight: .bold, size: 18, color: .white)
                .padding()
                .background(Color.prime)
        }
        .background(Color.prime)
        .cornerRadius(12)
        .padding([.leading, .trailing], 32)
        .padding([.top, .bottom], 16)
    }
    
    var secondaryActionButton: some View {
        Button(action: {
            showAlert = true
        }) {
            Text("Save Item")
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 30)
                .walshiemFont(style: .caption1, weight: .bold, size: 18, color: .black)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.prime, lineWidth: 1)
                )
        }
        .padding([.leading, .trailing], 32)
        .padding([.bottom], 16)
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Product successfully added to your favorites!"),
                  message: nil,
                  dismissButton: .default(Text("OK")))
        }
        .actionSheet(isPresented: $showActionSheet, content: {
            let action1 = ActionSheet.Button.default(Text("Apple Pay")) {}
            let action2 = ActionSheet.Button.default(Text("Credit Card")) {}
            let action3 = ActionSheet.Button.destructive(Text("Cancel")){}
            return ActionSheet(title: Text("How do you want to pay?"),
                               message: Text(""),
                               buttons: [action1, action2, action3])
         })
    }
    
    var descriptionView: some View {
        VStack(alignment: .center, spacing: 8) {
            Text(desciptionTitle)
                .walshiemFont(style: .caption1, weight: .bold, size: 16, color: Color.prime)
                .frame(minWidth: 0, maxWidth: .infinity)
            Text(description)
                .walshiemFont(style: .caption1, weight: .regular, size: 14, color: Color.tert)
                .frame(minWidth: 0, maxWidth: .infinity)
        }
        .padding([.leading, .trailing], 32)
    }
}

struct ItemDetailViewContainer: View {
    @State var showModal: Bool = true
    
    var body: some View {
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

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailViewContainer()
    }
}
