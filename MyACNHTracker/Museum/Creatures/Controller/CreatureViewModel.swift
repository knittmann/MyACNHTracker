//
//  CreatureViewModel.swift
//  MyACNHTracker
//
//  Created by Krista Nittmann on 6/22/20.
//  Copyright © 2020 Krista Nittmann. All rights reserved.
//

import Foundation

import Foundation
import Combine
import CoreData

class CreatureViewModel: ObservableObject {
    
    // MARK: - Public properties
    @Published var creatureArray: [Creature] = []
    
    // MARK: - Private properties
    private var apiPublisher: AnyPublisher<[String: Creature], Never>?
    
    private var apiCancellable: AnyCancellable? {
        willSet {
            apiCancellable?.cancel()
        }
    }
    
    init() {
        
        creatureArray = Bundle.main.decode([Creature].self, from: "creatures.json")
//        jsonToCoreData()
        
    }
    
    private func jsonToCoreData() {
        for creature in creatureArray {
            let new = CreatureCD(context: CreatureListView().moc)
            //            new.caught = creature.caught
            new.critterpediaFilename = creature.critterpediaFilename
            new.critterpediaImage = creature.critterpediaImage
            //            new.donated = creature.donated
            new.furnitureFilename = creature.furnitureFilename
            new.furnitureImage = creature.furnitureImage
            new.hhaBaseScore = Int16(creature.hhaBaseScore ?? 0)
            new.iconFilename = creature.iconFilename
            new.iconImage = creature.iconImage
            new.id = creature.id
            new.lightingType = creature.lightingType
            new.name = creature.name
            new.rainSnowCatchUp = creature.rainSnowCatchUp ?? false
            new.sell = Int16(creature.sell ?? 0)
            new.shadow = creature.shadow
            new.size = creature.size
            new.sourceSheet = creature.sourceSheet
            new.spawnRates = creature.spawnRates
            new.specialSell = Int16(creature.specialSell ?? 0)
            new.surface = creature.surface ?? false
            new.totalCatchesToUnlock = Int16(creature.totalCatchesToUnlock ?? 0)
            new.weather = creature.weather
            new.whereHow = creature.whereHow
        }
        
        try? CreatureListView().moc.save()
    }
    
    
}
