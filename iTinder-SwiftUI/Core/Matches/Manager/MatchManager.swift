//
//  MatchManager.swift
//  iTinder-SwiftUI
//
//  Created by Khondakar Afridi on 3/6/24.
//

import Foundation

@MainActor
class MatchManager : ObservableObject{
    @Published var matchedUser: User?
    func checkForMatch(withUser user: User){
        let didMatch = Bool.random()
        if didMatch{
            matchedUser = user
        }
    }
}
