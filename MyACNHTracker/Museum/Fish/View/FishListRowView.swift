//
//  FishListRowView.swift
//  ACNHTracker
//
//  Created by Krista Nittmann on 6/28/20.
//  Copyright © 2020 Krista Nittmann. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct FishListRowView: View {
    
    let fish: Fish
    
    var body: some View {
        
        // Row
        HStack (alignment: .center, spacing: 0) {
            
            NavigationLink(destination: FishDetailView(fish: fish)) {
                
                // FIRST COLUMN: Fish image
                WebImage(url: URL(string: "\(fish.imageURI!)"))
                    // Supports options and context, like `.delayPlaceholder` to show placeholder only when error
                    .onSuccess { image, data, cacheType in
                        // Success
                        // Note: Data exist only when queried from disk cache or network. Use `.queryMemoryData` if you really need data
                }
                    .resizable()
                    .placeholder(Image(systemName: "icon-fish"))
                    .placeholder {
                        Rectangle().foregroundColor(.gray)
                    }
                    .indicator(.activity) // Activity Indicator
                    .transition(.fade(duration: 0.5))
                    .frame(width: 45, height: 45, alignment: .center)
                    .scaledToFit()
                
                // SECOND COLUMN: fish name over the prices.
                VStack(alignment: .leading, spacing: 1) {
                    Text(fish.localizedName.capitalized)
//                    HStack {
//                        PriceView(priceType: .nookSell, priceAmount: Int16(fish.price))
//                        PriceView(priceType: .cjSell, priceAmount: Int16(fish.priceCj))
//                    }
                } // End of second column.
                    .layoutPriority(1)
                
                Spacer()
                
                // THIRD COLUMN: Extra details
                VStack (alignment: .trailing, spacing: 1) {
                    Text(fish.availability.availableMonths)
                        .font(.footnote)
                    
                    Text(fish.availability.availableTimes)
                        .font(.footnote)
                } // End of third column.
            } // End NavigationLink.
                
        } // End Main Hstack
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 2)
    } // End of View body
    
//    fileprivate func checkTime() -> Text {
//        if fish.availability.isAllDay {
//            return Text("All Day")
//                .font(.footnote)
//        } else if let time = fish.availability.time?.rawValue {
//            return Text(time)
//        }
//        else {
//            return Text("")
//        }
//    }
    
}

struct FishListRowView_Previews: PreviewProvider {
    static var previews: some View {
        FishListRowView(fish: fishPreview)
    }
}
