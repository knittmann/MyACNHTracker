//
//  MuseumView.swift
//  ACNHTracker
//
//  Created by Krista Nittmann on 6/16/20.
//  Copyright © 2020 Krista Nittmann. All rights reserved.
//

import SwiftUI

struct MuseumView: View {
    
    @State private var selectedPicker = 0
    @ObservedObject var museumVM = MuseumViewModel()
    var museumCategories = ["Art", "Bugs", "Fish", "Fossils", "Diving"]
    
    private enum Filter: String, CaseIterable {
        case art, bugs, fish, fossils, diving
    }
    
    @State private var currentFilter = Filter.art
    
//    var currentCreatures: [Creature] {
//        get {
//            if currentFilter == .art {
//                return museumVM.art
//            } else if currentFilter == .bugs {
//                return museumVM.bugs
//            } else if currentFilter == .test {
//                return museumVM.fish
//            } else if currentFilter == .fossils {
//                return museumVM.fossils
//            } else {
//                return []
//            }
//        }
//    }
    
//    var museumCategories = [MuseumCategory.Art, MuseumCategory.Bugs, MuseumCategory.Fish, MuseumCategory.Fossils]
    
    var body: some View {
        
        NavigationView {
            
            
            VStack {
                
                Picker(selection: $currentFilter, label: Text("")) {
                    ForEach(Filter.allCases, id: \.self) {
                        Text(LocalizedStringKey($0.rawValue.capitalized))
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
                if currentFilter == .art {
                    ArtListView()
                } else if currentFilter == .bugs {
                    BugListView()
                } else if currentFilter == .fish {
                    FishListView()
                } else if currentFilter == .fossils {
                    FossilListView()
                } else if currentFilter == .diving {
                    SeaCreatureListView()
                }
            }
            .navigationBarTitle(Text("\(currentFilter.rawValue.capitalized)"))
        }
        
    }
}

struct MuseumView_Previews: PreviewProvider {
    static var previews: some View {
        MuseumView()
    }
}
