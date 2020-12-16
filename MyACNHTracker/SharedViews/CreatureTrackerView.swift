//
//  CreatureTrackerView.swift
//  MyACNHTracker
//
//  Created by Krista Nittmann on 7/11/20.
//  Copyright © 2020 Krista Nittmann. All rights reserved.
//

import SwiftUI

struct CreatureTrackerView: View {
    
//    let fish: Fish
    
    @State var caught: Bool
    @State var donated: Bool
    
    var caughtImage: String {
        return self.caught ? "checkmark.seal.fill" : "checkmark.seal"
//        return fish.checkCaught ? "checkmark.seal.fill" : "checkmark.seal"
    }
    
    var donatedImage: String {
        return self.donated ? "checkmark.seal.fill" : "checkmark.seal"
    }
    
    var body: some View {
        HStack {
            
            VStack (alignment: .center){
                Text("Caught?")
                .textStyle(ItemTitleStyle())
                
                Button(action: {
                    self.caught = !self.caught
                }) {
                    Image(systemName: caughtImage)
                }
                .buttonStyle(BorderlessButtonStyle())
                .animation(.spring(response: 0.5, dampingFraction: 0.3, blendDuration: 0.5))
            }
            
            VStack {
                Text("Donated?")
                .textStyle(ItemTitleStyle())
                
                Button(action: {
                    self.donated = !self.donated
                }) {
                    Image(systemName: donatedImage)
                }
                .buttonStyle(BorderlessButtonStyle())
                .animation(.spring(response: 0.5, dampingFraction: 0.3, blendDuration: 0.5))
            }
        }
    }
}

struct CritterTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            CreatureTrackerView(caught: true, donated: false)
        }
        .previewLayout(PreviewLayout.sizeThatFits)
        .padding()
        .previewDisplayName("Default Preview")
    }
}
