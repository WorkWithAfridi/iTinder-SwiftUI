//
//  MainTabView.swift
//  iTinder-SwiftUI
//
//  Created by Khondakar Afridi on 18/4/24.
//

import SwiftUI
import PhosphorSwift

struct MainTabView: View {
    @State private var selectedTab = 0
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        TabView(selection: $selectedTab) {
            VStack {
                CardStackView()
            }
            .tabItem {
                Image(systemName: "flame")
            }
            .tag(0)
            
            Text("Search View")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.pink)
                }
                .tag(1)
            
            Text("Inbox View")
                .tabItem {
                    Image(systemName: "bubble.left.and.bubble.right")
                }
                .tag(2)
            CurrentUserProfileView(user: MockData.users.first!)
                .tabItem {
                    Image(systemName: "person")
                        .foregroundStyle(.pink)
                }
                .tag(3)
        }
        .accentColor(colorScheme == .dark ?  .purple : .red)
    }
}

#Preview {
    MainTabView()
}
