//
//  FishListCardView.swift
//  ACNHTracker
//
//  Created by Krista Nittmann on 6/28/20.
//  Copyright © 2020 Krista Nittmann. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct CreatureListRowView: View {
    
    let creature: Creature
    
    var body: some View {
        
        // Row
        HStack (alignment: .center, spacing: 0) {
            
            NavigationLink(destination: CreatureDetailView(creature: creature)) {
                
                // FIRST COLUMN: Fish image
                WebImage(url: URL(string: "\(creature.critterpediaImage ?? "Unknown")"))
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
                
                // SECOND COLUMN: fish name over the prices.
                VStack(alignment: .leading, spacing: 1) {
                    Text(creature.name.capitalized)
                    HStack {
                        PriceView(priceType: .nookSell, priceAmount: creature.sell ?? 0)
                        PriceView(priceType: .cjSell, priceAmount: creature.specialSell ?? 0)
                    }
                } // End of second column.
                
//                Spacer()
                
                // THIRD COLUMN: Extra details
//                VStack (alignment: .trailing, spacing: 1) {
//
//                    /// Check if fish is available all year. If not, get the months the fish is available.
//                    checkMonth()
//
//                    /// Check if fish is available all day. If not, get the times the fish is available.
//                    checkTime()
//
//                } // End of third column.
            } // End NavigationLink.
                
        } // End Main Hstack
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 2)
    } // End of View body
    
//    fileprivate func checkMonth() -> Text{
//        if fish.availability.isAllYear {
//            return Text("All Year")
//                .font(.footnote)
//        } else {
//            return Text(fish.availability.monthNorthern)
//                .font(.footnote)
//        }
//    }
//
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


//struct CreatureListRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreatureListRowView()
//    }
//}
