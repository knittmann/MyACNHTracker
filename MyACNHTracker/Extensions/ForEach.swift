//
//  ForEach.swift
//  MyACNHTracker
//
//  Created by Krista Nittmann on 8/14/20.
//  Copyright © 2020 Krista Nittmann. All rights reserved.
//

import SwiftUI

public extension ForEach where Content: View {
    init<Base: RandomAccessCollection>(
        _ base: Base,
        @ViewBuilder content: @escaping (Base.Index) -> Content
    )
        where
        Data == IndexedCollection<Base>,
        Base.Element: Identifiable,
        ID == Base.Element.ID
    {
        self.init(IndexedCollection(base), id: \.element.id) {
            index, _ in content(index)
        }
    }
}

