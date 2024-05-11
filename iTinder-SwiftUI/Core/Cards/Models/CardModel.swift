//
//  CardModel.swift
//  iTinder-SwiftUI
//
//  Created by Khondakar Afridi on 9/5/24.
//

import Foundation

struct CardModel{
    let user: User
}


extension CardModel: Identifiable, Equatable{
    var id: String { return user.id }
}
