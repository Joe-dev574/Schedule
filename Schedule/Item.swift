//
//  Item.swift
//  Schedule
//
//  Created by Joseph DeWeese on 1/30/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
