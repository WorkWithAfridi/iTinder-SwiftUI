//
//  iTinder_SwiftUIApp.swift
//  iTinder-SwiftUI
//
//  Created by Khondakar Afridi on 18/4/24.
//

import SwiftUI
import SwiftData

@main
struct iTinder_SwiftUIApp: App {
    
    @ObservedObject var matchManager = MatchManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(matchManager)
        }
    }
}
