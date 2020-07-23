//
//  PriceView.swift
//  MyACNHTracker
//
//  Created by Krista Nittmann on 6/25/20.
//  Copyright © 2020 Krista Nittmann. All rights reserved.
//

import SwiftUI

struct PriceView: View {
    
    let priceType: PriceTypes
    let priceAmount: Int16
    
    var body: some View {
        HStack (spacing: 2) {
            Image(priceType.priceIcon())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
            Text("\(priceAmount)")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.blue)
        }
        .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 8))
        .background(RoundedRectangle(cornerRadius: 16))
        .foregroundColor(Color("ACNHTeal"))
    }
}

enum PriceTypes: CaseIterable {
    case nookSell, nookBuy, cjSell, flickSell
    
    func priceIcon() -> String {
        switch self {
        case .nookSell: return "icon-bell"
        case .nookBuy: return "icon-bells"
        case .cjSell: return "cj"
        case .flickSell: return "flick"
        }
    }
}

struct PriceView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            PriceView(priceType: .nookSell, priceAmount: 100)
            PriceView(priceType: .nookBuy, priceAmount: 200)
            PriceView(priceType: .cjSell, priceAmount: 300)
            PriceView(priceType: .flickSell, priceAmount: 4400)
        }
        .previewLayout(PreviewLayout.sizeThatFits)
        .padding()
        .previewDisplayName("Default Preview")
        
    }
}
