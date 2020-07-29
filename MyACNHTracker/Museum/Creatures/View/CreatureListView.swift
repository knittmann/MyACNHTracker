//
//  CreatureListView.swift
//  ACNHTracker
//
//  Created by Krista Nittmann on 6/23/20.
//  Copyright © 2020 Krista Nittmann. All rights reserved.
//

//import SwiftUI
//import Combine
//
//struct CreatureListView: View {
//    
//    //    private var apiPublisher: AnyPublisher<[String: Creature], Never>?
//    //    private var apiPublisher: AnyPublisher<[String: Fish], Never>?
//    
//    @Environment(\.managedObjectContext) var moc
//    
//    @ObservedObject var creatureVM = CreatureViewModel()
//    
//    var currentCreature: [Creature]  {
//        return creatureVM.creatureArray
//    }
//    
//    var body: some View {
//        List {
//            ForEach (currentCreature) { creature in
//                CreatureListRowView(creature: creature)
//            }
//        }
//        .onAppear {UITableView.appearance().separatorStyle = .none}
//    }
//}
//
//struct CreatureListView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreatureListView()
//    }
//}


