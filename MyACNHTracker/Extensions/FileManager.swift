//
//  FileManager.swift
//  MyACNHTracker
//
//  Original from raywenderlich.com found in "Saving Data in iOS" tutorial:
//  https://www.raywenderlich.com/5429634-saving-data-in-ios
//  
//  Created by Krista Nittmann on 8/13/20.
//  Copyright © 2020 Krista Nittmann. All rights reserved.
//

import Foundation

public extension FileManager {
  static var documentsDirectoryURL: URL {
    return `default`.urls(for: .documentDirectory, in: .userDomainMask)[0]
  }
}
