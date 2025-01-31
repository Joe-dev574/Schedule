//
//  CustomTabBar.swift
//  Schedule
//
//  Created by Joseph DeWeese on 1/30/25.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var activeTab: TabModel
  
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            let allOffset = size.width - (40 * CGFloat(TabModel.allCases.count - 1))
            
            HStack(spacing: 8) {
                HStack(spacing: activeTab == .all ? -15 : 8) {
                    ForEach(TabModel.allCases.filter({ $0 != .all }), id: \.rawValue) { tab in
                        ResizableTabButton(tab)
                    }
                }
                
                if activeTab == .all {
                    ResizableTabButton(.all)
                        .transition(.offset(x: allOffset))
                }
            }
            .padding(.horizontal, 15)
        }
        .frame(height: 50)
    }
   
}

