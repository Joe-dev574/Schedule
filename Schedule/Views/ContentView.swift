//
//  ContentView.swift
//  Schedule
//
//  Created by Joseph DeWeese on 1/30/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State private var showAddSheet = false
    @State private var activeTab: TabModel = .today
    /// Scroll Properties
    @State private var scrollOffset: CGFloat = 0
    @State private var topInset: CGFloat = 0
    @State private var startTopInset: CGFloat = 0
    
    var body: some View {
        NavigationStack {
            ScrollView (.vertical){
                VStack(spacing: 0){
                    CustomTabBar(activeTab: $activeTab)
                        .fontDesign(.serif)
                        .background {
                            let progress = min(max((scrollOffset + startTopInset - 110) / 15, 0), 1)
                            ZStack(alignment: .bottom) {
                                Rectangle()
                                    .fill(.ultraThinMaterial)
                                
                                /// Divider
                                Rectangle()
                                    .fill(.gray.opacity(0.3))
                                    .frame(height: 1)
                            }
                            .padding(.top, -topInset)
                            .opacity(progress)
                        }
                        .offset(y: (scrollOffset + topInset) > 0 ? (scrollOffset + topInset) : 0)
                        .zIndex(1000)
                    
                    /// YOUR OTHER VIEW HERE
                    LazyVStack(alignment: .leading) {
                        Text(activeTab.rawValue + (activeTab == .all ? "" : " Mails"))
                            .font(.caption2)
                            .foregroundStyle(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(15)
                    .zIndex(0)
                }
            }
                .onScrollGeometryChange(for: CGFloat.self, of: {
                    $0.contentOffset.y
                }, action: { oldValue, newValue in
                    scrollOffset = newValue
                })
                .onScrollGeometryChange(for: CGFloat.self, of: {
                    $0.contentInsets.top
                }, action: { oldValue, newValue in
                    if startTopInset == .zero {
                        startTopInset = newValue
                    }
                    topInset = newValue
                })
                //MARK:  ToolBar
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        EditButton()
                    }
                    ToolbarItem (placement: .principal) {
                        LogoView()
                    }
                    ToolbarItem(placement: .topBarTrailing){
                        Button{
                            showAddSheet = true
                            //         HapticManager.notification(type: .success)
                        } label: {
                            Image(systemName: "plus")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .frame(width: 45, height: 45)
                                .background(.blue.gradient, in: .circle)
                                .contentShape(.circle)
                        }
                        .sheet(isPresented: $showAddSheet) {
                            AddItemView()
                                .presentationDetents([.medium])
                        }
                        .blur(radius: showAddSheet ? 8 : 0)
                    }
                }
              
        }
    }
}
#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
