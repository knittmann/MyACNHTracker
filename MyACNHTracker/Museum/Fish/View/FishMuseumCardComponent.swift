//
//  FishMuseumCardComponent.swift
//  MyACNHTracker
//
//  Bottom half of card view in FishDetailView.swift that displays the
//  catch phrase(s) and museum phrase.
//
//  Created by Krista Nittmann on 6/30/20.
//  Copyright © 2020 Krista Nittmann. All rights reserved.
//

import SwiftUI

struct FishMuseumCardComponent: View {
    
    let fish: Fish

    var body: some View {
        
        ScrollView {
        VStack(alignment: .leading, spacing: 0) {
            
            HStack (alignment: .top) {
                Text("Museum Details")
                    .textStyle(CardOverlayStyle())
            }
            
            VStack (alignment: .leading, spacing: 6) {
                
                Text("Catch Phrase(s)")
                    .textStyle(ItemTitleStyle())
                Text("\"\(fish.catchPhrase)\"")
                    .textStyle(ItemBodyStyle())
                ForEach (fish.altCatchPhraseArray, id: \.self) {
                    Text("\"\($0)\"")
                        .textStyle(ItemBodyStyle())
                    .lineLimit(nil)
                }
            }
                .padding([.leading, .trailing], 10)
            .padding([.top, .bottom], 5)
            
            VStack (alignment: .leading, spacing: 6) {
                Text("Museum Phrase")
                    .textStyle(ItemTitleStyle())
                Text("\"\(fish.museumPhrase)\"")
                    .textStyle(ItemBodyStyle())
                    .lineLimit(nil)
            }
            .padding([.leading, .trailing], 10)
            .padding([.top, .bottom], 5)
            
            
            Spacer()
            
        }
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 2)
    }
    }
}

struct FishMuseumCardComponent_Previews: PreviewProvider {
    static var previews: some View {
        FishMuseumCardComponent(fish: fishPreview)
    }
}
