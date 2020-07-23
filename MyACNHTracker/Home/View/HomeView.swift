//
//  ContentView.swift
//  acnh
//
//
//  SwiftUI view file that contains the content of the first screen to appear when the app starts.
//
//  Created by Krista Nittmann on 6/10/20.
//  Copyright © 2020 Krista Nittmann. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection){
            Text("Home View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("icon-leaf-tabbar")
                        Text("Home")
                    }
                }
                .tag(0)
                .navigationBarTitle("Home")
            VillagerListView()
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Villagers")
                    }
                }
                .tag(1)
                .navigationBarTitle("Villagers")
            MuseumView()
                .font(.title)
                .tabItem {
                    VStack {
                        Image("icon-fossil-tabbar")
                        Text("Museum")
                    }
                }
                .navigationBarHidden(true)
                .navigationBarTitle("Museum")
                .tag(2)
            Text("Plants View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Plants")
                    }
                }
                .tag(3)
            Text("Items View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Items")
                    }
                }
                .tag(4)
        }
    }
}



struct HomeView_Previews: PreviewProvider {
    
    static let fishListView = FishListView()
    
    static var previews: some View {
        HomeView()
    }
}
