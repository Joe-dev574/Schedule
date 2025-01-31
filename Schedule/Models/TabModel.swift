//
//  TabModel.swift
//  Schedule
//
//  Created by Joseph DeWeese on 1/30/25.
//

import SwiftUI

enum TabModel: String, CaseIterable {
        case today = "Today"
        case upcoming = "Upcoming"
        case complete = "Complete"
        case all = "All"
    
    var color: Color {
        switch self {
        case .today: .blue
        case .upcoming: .orange
        case .complete: .green
        case .all: Color.primary
        }
    }
    var symbolImage: String {
        switch self {
        case .today: "alarm"
        case .upcoming: "calendar"
        case .complete: "calendar.badge.checkmark"
        case .all: "tray"
        }
    }
}
