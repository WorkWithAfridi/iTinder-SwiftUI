//
//  CardService.swift
//  iTinder-SwiftUI
//
//  Created by Khondakar Afridi on 9/5/24.
//

import Foundation
struct CardService{
    func fetchCardModels() async throws -> [CardModel]{
        let users = MockData.users
        return users.map { user in
            CardModel(user: user)
        }
    }
}
