//
//  FishListView.swift
//  MyACNHTracker
//
//  Created by Krista Nittmann on 6/16/20.
//  Copyright © 2020 Krista Nittmann. All rights reserved.
//

import SwiftUI
import Combine
import SDWebImageSwiftUI

struct FishListView: View {
    
    @State private var searchText: String = ""
    @State private var showCancelButton: Bool = false
    
    private var apiPublisher: AnyPublisher<[String: Fish], Never>?
    
    @ObservedObject var viewModel = FishViewModel()
    
    var currentFish: [Fish]  {
        return viewModel.fishArray
    }
    
    var body: some View {
        VStack {
            
            HStack {
                SearchBar(text: $searchText, placeholder: "Search")
            }
            
            List {
                ForEach (currentFish.filter { self.searchText.isEmpty ? true : $0.localizedName.lowercased().contains(self.searchText.lowercased())}) { fish in
                    FishListRowView(fish: fish)
                }
            }
            .onAppear {UITableView.appearance().separatorStyle = .none}
            .resignKeyboardOnDragGesture()
        }
    }
}

struct FishListView_Previews: PreviewProvider {
    static var previews: some View {
        FishListView()
    }
}
