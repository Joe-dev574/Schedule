//
//  Item.swift
//  Schedule
//
//  Created by Joseph DeWeese on 1/30/25.
//

import SwiftUI
import SwiftData

@Model
final class Item {
    /// Properties
    var title: String
    var remarks: String
    var dateAdded: Date
    var dateStarted: Date = Date.distantPast
    var dateCompleted: Date = Date.distantPast
    var category: String

    init(
        title: String = "",
        remarks: String = "",
        dateAdded: Date = Date.now,
        category: TabModel
    ) {
        self.title = title
        self.remarks = remarks
        self.dateAdded = dateAdded
        self.category = category.rawValue
    }
    @Transient
    var rawCategory: TabModel? {
        return TabModel.allCases.first(where: { category == $0.rawValue })
    }
}
  
       
