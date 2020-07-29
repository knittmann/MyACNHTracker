//
//  CreatureDetailsCardComponent.swift
//  MyACNHTracker
//
//  Created by Krista Nittmann on 7/1/20.
//  Copyright © 2020 Krista Nittmann. All rights reserved.
//

//import SwiftUI
//import SDWebImageSwiftUI
//
//struct CreatureDetailsCardComponent: View {
//    
//    let creature: Creature
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 0) {
//            
//            // Main image.
//            WebImage(url: URL(string: "\(creature.critterpediaImage ?? "Unknown")"))
//                .onSuccess { image, data, cacheType in
//                    // Success
//                    // Note: Data exist only when queried from disk cache or network. Use `.queryMemoryData` if you really need data
//            }
//                .resizable()
//                .placeholder(Image(systemName: "icon-fish"))
//                .placeholder {
//                    Rectangle().foregroundColor(.gray)
//                }
//                .indicator(.activity)
//                .transition(.fade(duration: 0.5))
//                .scaledToFill()
//                .frame(minWidth: nil, idealWidth: nil, maxWidth: UIScreen.main.bounds.width, minHeight: nil, idealHeight: nil, maxHeight: 300, alignment: .center)
//                .clipped()
//                .overlay(
//                    Text("Availability Details")
//                        .fontWeight(Font.Weight.medium)
//                        .font(Font.system(size: 16))
//                        .foregroundColor(Color.white)
//                        .padding([.leading, .trailing], 16)
//                        .padding([.top, .bottom], 8)
//                        .background(Color("ACNHTeal"))
//                        .mask(RoundedCorners(tl: 0, tr: 0, bl: 0, br: 15)),
//                    alignment: .topLeading
//            )
//            
//            // Horizontal Line separating details and price
////            Rectangle()
////                .foregroundColor(Color.gray.opacity(0.3))
////                .frame(width: nil, height: 1, alignment: .center)
////                .padding([.leading, .trailing], -12)
//            
//            VStack {
//            
//            // Stack bottom half of card
//            VStack(alignment: .center, spacing: 6) {
//                
//                // 'Time & Month' Horizontal stacks
//                HStack(alignment: .center, spacing: 6) {
//                    
//                    HStack {
//                        
//                        Text("Time:")
//                            .textStyle(ItemCellTitleStyle())
//                        
//                        /// Check if fish is available all year. If not, get the months the fish is available.
////                        checkTime()
////                            .textStyle(ItemCellBodyStyle())
//                    }
//                    .background(Color("ACNHTeal"))
//                    .cornerRadius(7)
//                    
//                    Spacer()
//                    
//                    HStack {
//                        
//                        Text("Months:")
//                            .textStyle(ItemCellTitleStyle())
//                        
//                        /// Check if fish is available all day. If not, get the times the fish is available.
////                        checkMonth()
////                            .textStyle(ItemCellBodyStyle())
//                    }
//                    .background(Color("ACNHTeal"))
//                    .cornerRadius(7)
//                }
//                .padding([.top, .bottom], 4)
//                
//                // 'Location:' and 'Shadow:' HStack
//                HStack(alignment: .center, spacing: 6) {
//                    HStack {
//                        Text("Location:")
//                            .textStyle(ItemCellTitleStyle())
//                        Text("text")
//                            .textStyle(ItemCellBodyStyle())
//                    }
//                    .background(Color("ACNHTeal"))
//                    .cornerRadius(7)
//                    Spacer()
//                    
//                    HStack(alignment: .center, spacing: 0) {
//                        Text("Shadow:")
//                            .textStyle(ItemCellTitleStyle())
//                        Text(creature.shadow ?? "Unknown")
//                            .textStyle(ItemCellBodyStyle())
//                    }
//                    .background(Color("ACNHTeal"))
//                    .cornerRadius(7)
//                    
//                } // End of 'Location:' and 'Shadow:' HStack
//                    .padding([.top, .bottom], 4)
//                
//                // 'Rarity:' and 'PriceView()' HStack
//                HStack(alignment: .center, spacing: 4) {
//                    
//                    HStack {
//                        Text("Rarity:")
//                            .textStyle(ItemCellTitleStyle())
//                        Text(creature.spawnRates ?? "Unknown")
//                            .textStyle(ItemCellBodyStyle())
//                    }
//                    .background(Color("ACNHTeal"))
//                    .cornerRadius(7)
//                    
//                    
//                    Spacer()
//                    
//                    HStack {
//                        PriceView(priceType: .nookSell, priceAmount: creature.sell ?? 0)
//                        
//                        PriceView(priceType: .cjSell, priceAmount: creature.specialSell ?? 0)
//                    }
//                    
//                } // end of 'Rarity:' and 'PriceView()' HStack
//                    .padding([.top, .bottom], 4)
//                
//                // Caught and Donated View
//                VStack (alignment: .center, spacing: 4) {
//                    CreatureTrackerView(caught: true, donated: false)
//                }
//            }
//                
//            .padding(12)
//            }
//            .background(Color("ACNHOrange"))
//        }
//        .background(Color.white)
//        .cornerRadius(15)
//        .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 2)
//    }
//    
////    fileprivate func checkMonth() -> Text{
////        if fish.availability.isAllYear {
////            return Text("All Year")
////        } else {
////            return Text(fish.availability.monthNorthern)
////        }
////    }
////
////    fileprivate func checkTime() -> Text {
////        if fish.availability.isAllDay {
////            return Text("All Day")
////        } else if let time = fish.availability.time?.rawValue {
////            return Text(time)
////        }
////        else {
////            return Text("")
////        }
////    }
//}

//struct FishDetailsCardComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        FishDetailsCardComponent(fish: fishPreview)
//    }
//}
