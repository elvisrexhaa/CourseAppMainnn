//
//  TabBarView.swift
//  CourseApp
//
//  Created by Elvis Rexha on 19/04/2024.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var selectedTab: Tab = .home
    @State private var hideTabBar: Bool = false
    @StateObject private var homeViewModel = HomeViewModel()
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                
                HomeView(hideTabBar: $hideTabBar)
                    .tabItem { /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Item Label@*/Text("Label")/*@END_MENU_TOKEN@*/ }
                    .tag(Tab.home)
                
                ProfileView()
                    .tabItem { /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Item Label@*/Text("Label")/*@END_MENU_TOKEN@*/ }
                    .tag(Tab.profile)
                
                Text("Home")
                    .tabItem { /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Item Label@*/Text("Label")/*@END_MENU_TOKEN@*/ }
                    .tag(Tab.settings)
             
             
            }
            
            if !hideTabBar {
                CustomTabBar(selectedTab: $selectedTab)
            }
            
        }
        .environmentObject(homeViewModel)
        .onAppear {
            UITabBar.appearance().isHidden = true
        }
        
        
    }
}

#Preview {
    TabBarView()
        .environmentObject(HomeViewModel())
}
