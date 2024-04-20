//
//  CustomTabBar.swift
//  CourseApp
//
//  Created by Elvis Rexha on 19/04/2024.
//

import SwiftUI

enum Tab: String, CaseIterable {
    
    case home = "house"
    case settings = "gearshape"
    case profile = "person"
    
}

struct TabButton: View {
    let symbolName: String
    let isTabButtonPressed: (() -> Void)?
    @Binding var selectedTab: Tab
    
    var body: some View {
        Image(systemName: symbolName)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .foregroundStyle(selectedTab.rawValue == symbolName ? .bg : .gray)
            .fontWeight(.bold)
            .onTapGesture {
                withAnimation(.snappy) {
                    isTabButtonPressed?()
                }
            }
    }
}





struct CustomTabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                TabButton(symbolName: tab.rawValue, isTabButtonPressed: {
                    selectedTab = tab
                }, selectedTab: $selectedTab)
            }
        }
        .frame(width: 250, height: 60)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.white)
                    .shadow(color: .white, radius: 3, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 3)
            }
        
        )
       
    }
}

#Preview {
    ZStack {
        Color.bg.ignoresSafeArea()
        
        CustomTabBar(selectedTab: .constant(.home))
    }
}
