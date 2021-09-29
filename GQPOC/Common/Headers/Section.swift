//
//  Section.swift
//  GQPOC
//
//  Created by Aqeel Bhat on 14/09/21.
//

import SwiftUI

struct Section: View {
    
    var title: String
    var subtitle: String
    var disclosureImageUrl: String?
    var disclosureText: String?
    var backgroundColor: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            titleView
        }
    }
    
    private var titleView: some View {
        HStack(alignment: .top, spacing: 12)  {
            contentView
            if disclosureText != nil, disclosureImageUrl != nil {
                disclosureView
            }
        }
        .padding()
        .background(backgroundColor)
    }
    
    private var contentView: some View {
        VStack(alignment: .leading, spacing: 9) {
            Group {
                Text(title)
                    .walshiemFont(
                        style: .title1,
                        weight: .heavy,
                        size: 24,
                        color: .prime
                    )
                Text(subtitle)
                    .walshiemFont(
                        style: .subheadline,
                        weight: .regular,
                        size: 14,
                        color: .secon
                    )
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    private var disclosureView: some View {
        VStack(spacing: 5) {
            Image(systemName: disclosureImageUrl ?? "xmark.octagon.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30, alignment: .trailing)
            Text(disclosureText ?? "xmark.octagon.fill")
        }
        .walshiemFont(
            style: .subheadline,
            weight: .regular,
            size: 14,
            color: .secon
        )
    }
    
}

struct Section_Previews: PreviewProvider {
    static var previews: some View {
        Section(
            title: "What to wear today?",
            subtitle: "28 August 2021, London",
            disclosureImageUrl: "cloud.sun",
            disclosureText: "21°C",
            backgroundColor: .white
        )
    }
}
