//
//  Binding.swift
//  MyACNHTracker
//
//  Created by Krista Nittmann on 8/14/20.
//  Copyright © 2020 Krista Nittmann. All rights reserved.
//

import SwiftUI

public extension Binding where Value: CaseIterable & Equatable {
  var caseIndex: Binding<Value.AllCases.Index> {
    Binding<Value.AllCases.Index>(
      get: { Value.allCases.firstIndex(of: self.wrappedValue)! },
      set: { self.wrappedValue = Value.allCases[$0] }
    )
  }
}
