//
//  FishViewModel.swift
//  MyACNHTracker
//
//  Created by Krista Nittmann on 6/16/20.
//  Copyright © 2020 Krista Nittmann. All rights reserved.
//

import Foundation
import Combine

class FishViewModel: ObservableObject {

    // MARK: - Public properties
    @Published var fishArray: [Fish] = []
    
    // MARK: - Private properties
    private var apiPublisher: AnyPublisher<[String: Fish], Never>?

    private var apiCancellable: AnyCancellable? {
        willSet {
            apiCancellable?.cancel()
        }
    }
    
    init() {
        apiPublisher = ACNHApiManager.fetch(endpoint: .fish)
            .subscribe(on: DispatchQueue.global())
            .replaceError(with: [:])
            .eraseToAnyPublisher()
        
        apiCancellable = apiPublisher?
            .subscribe(on: DispatchQueue.global())
            .map{
                $0.map{ $0.1}.sorted {
                    $0.localizedName.localizedCaseInsensitiveCompare($1.localizedName) ==  .orderedAscending }
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in
                self?.fishArray = $0
            })
    }
    
//    func toggleFishCaught(fish: Fish) -> Bool {
//        let added = fish.to
//
//        return added
//    }
//
//    public func toggleCritters(critter: Item) -> Bool {
//        let added = critters.toggle(item: critter)
//        save()
//        return added
//    }
    
//    func checkTime() -> Text {
//        if fish.availability.isAllDay {
//            return Text("All Day")
//        } else if let time = fish.availability.time?.rawValue {
//            return Text(time)
//        }
//        else {
//            return Text("")
//        }
//    }
    
}
