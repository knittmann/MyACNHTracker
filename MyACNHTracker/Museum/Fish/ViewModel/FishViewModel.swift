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
    @Published var fishArray: [Fish] = [] {
        didSet {
            saveJSON()
        }
    }
    
    let dataJSONURL = URL(fileURLWithPath: "fish",
                          relativeTo: FileManager.documentsDirectoryURL)
                          .appendingPathExtension("json")
    
//    init() {
//        loadJSON()
//    }
    
    private func loadJSON() {
        let decoder = JSONDecoder()
        
        // Uncomment to show the app specific document directory path.
        print(FileManager.documentsDirectoryURL)
        
        do {
            let data = try Data(contentsOf: dataJSONURL)
            fishArray = try decoder.decode([Fish].self, from: data)
        } catch let error {
            print(error)
        }
    }
    
    private func saveJSON() {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        do {
            // Encode task data.
            let data = try encoder.encode(fishArray)
            
            // Write encoded data to directory. AtomicWrite saves the data to a
            // separate file first, and once that succeeds, it switches that file
            // for the older one.
            try data.write(to: dataJSONURL, options: .atomicWrite)
        } catch let error {
            print(error)
        }
        
    }
    
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
    
}
