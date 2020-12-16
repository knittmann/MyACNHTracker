//
//  FishDetailView.swift
//  MyACNHTracker
//
//  Main View for fish details which displays FishDetailsCardComponent.swift
//  and FishMuseumCardComponent.swift.
//
//  Created by Krista Nittmann on 6/28/20.
//  Copyright © 2020 Krista Nittmann. All rights reserved.
//

import SwiftUI

struct FishDetailView: View {
    
    let fish: Fish
    
    var body: some View {

        VStack {
            
            FishDetailsCardComponent(fish: fish)
            
            FishMuseumCardComponent(fish: fish)
            
            Spacer()
        }
        .navigationBarTitle(fish.localizedName.capitalized)
    }
}

struct FishDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FishDetailView(fish: fishPreview)
    }
}
