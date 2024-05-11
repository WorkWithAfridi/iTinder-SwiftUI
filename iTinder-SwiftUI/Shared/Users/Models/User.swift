//
//  User.swift
//  iTinder-SwiftUI
//
//  Created by Khondakar Afridi on 9/5/24.
//

import Foundation

struct User: Identifiable, Equatable{
    let id: String
    let fullname: String
    var age: Int
    var profileImageUrls: [String]
}
