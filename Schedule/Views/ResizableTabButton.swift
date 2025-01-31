//
//  ResizableTabBar.swift
//  Schedule
//
//  Created by Joseph DeWeese on 1/30/25.
//

import SwiftUI
import SwiftData



//struct ResizableTabButton: View {
//    @Environment(\.modelContext) private var modelContext
//    @State private var activeTab: TabModel = .today
//    /// View Properties
//    @State private var searchText: String = ""
//    @State private var isSearchActive: Bool = false
// 

func ResizableTabButton(_ tab: TabModel) -> some View {
    @Environment(\.colorScheme) var scheme
    @State var activeTab: TabModel = .today
    var schemeColor: Color {
        scheme == .dark ? .black : .white
    }
    return HStack(spacing: 8) {
        Image(systemName: tab.symbolImage)
            .opacity(activeTab != tab ? 1 : 0)
            .overlay {
                Image(systemName: tab.symbolImage)
                    .symbolVariant(.fill)
                    .opacity(activeTab == tab ? 1 : 0)
            }
        
        if activeTab == tab {
            Text(tab.rawValue)
                .font(.callout)
                .fontWeight(.semibold)
                .lineLimit(1)
        }
    }
    .foregroundStyle(tab == .all ? schemeColor : activeTab == tab ? .white : .gray)
    .frame(maxHeight: .infinity)
    .frame(maxWidth: activeTab == tab ? .infinity : nil)
    .padding(.horizontal, activeTab == tab ? 10 : 20)
    .background {
        Rectangle()
            .fill(activeTab == tab ? tab.color :  .inActiveTab)
    }
    .clipShape(.rect(cornerRadius: 20, style: .continuous))
    .background {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .fill(.background)
            .padding(activeTab == .all && tab != .all ? -3 : 3)
    }
    .contentShape(.rect)
    .onTapGesture {
        guard tab != .all else { return }
        withAnimation(.bouncy) {
            if activeTab == tab {
                activeTab = .all
            } else {
                activeTab = tab
            }
        }
    }
}
