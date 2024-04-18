//
//  MainTabView.swift
//  iTinder-SwiftUI
//
//  Created by Khondakar Afridi on 18/4/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            Text("Swipping View")
                .tabItem {
                    Image(systemName: "flame")
                }
                .tag(0)
            Text("Search View")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)
            Text("Inbox View")
                .tabItem {
                    Image(systemName: "bubble")
                }
                .tag(2)
            Text("Profile View")
                .tabItem {
                    Image(systemName: "person")
                }
                .tag(3)
        }
    }
}

#Preview {
    MainTabView()
}
