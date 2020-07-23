//
//  MuseumViewModel.swift
//  MyACNHTracker
//
//  Created by Krista Nittmann on 6/20/20.
//  Copyright © 2020 Krista Nittmann. All rights reserved.
//

import Foundation

class MuseumViewModel: ObservableObject {
    
    @Published var museumCategory: String = ""
//    @Published var art: [Art] = []
//    @Published var bugs: [Bug] = []
//    @Published var fish: [Fish] = []
//    @Published var fossils: [Fossil] = []
//    @Published var seaCreatures: [SeaCreature] = []

    
    func setMuseumCategory(index: Int) {

        switch index {
        case 0:
            self.museumCategory = "art"
        case 1:
            self.museumCategory = "bugs"
        case 2:
            self.museumCategory = "fish"
        case 3:
            self.museumCategory = "fossils"
        case 4:
            self.museumCategory = "sea creatures"
        default:
            self.museumCategory = "art"
        }
    }

//    enum MuseumCategory: String, CaseIterable {
//        case art = "Art"
//        case bugs = "Bugs"
//        case fish = "Fish"
//        case fossils = "Fossils"
//
//        var category: String {
//            return "\(self)".map {
//                $0.isUppercase ? " \($0)" : "\($0)" }.joined().capitalized
//        }
        
//        init?(id: Int) {
//            switch id {
//            case 1: self = .art
//            case 2: self = .bugs
//            case 3: self = .fish
//            case 4: self = .fossils
//            }
//        }
//    }
    
    
    
}
