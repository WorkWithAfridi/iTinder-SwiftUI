//
//  MockData.swift
//  iTinder-SwiftUI
//
//  Created by Khondakar Afridi on 9/5/24.
//

import Foundation

struct MockData{
    static let users: [User] = [
        User(
            id: NSUUID().uuidString,
            fullname: "Jessie Makrov",
            age: 37,
            profileImageUrls: [
                "https://images.unsplash.com/photo-1713526721814-412688ede906?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                "https://images.unsplash.com/photo-1713526714045-eac4c8e14817?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                "https://images.unsplash.com/photo-1713526708767-ae5b1889772b?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
            ]
        ),
        User(
            id: NSUUID().uuidString,
            fullname: "Anne",
            age: 32,
            profileImageUrls: [
                "https://images.unsplash.com/photo-1703863129205-6df7f731c9c0?q=80&w=1664&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                "https://images.unsplash.com/photo-1703863128768-261ed05ff8d9?q=80&w=1664&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
            ]
        ),
        User(
            id: NSUUID().uuidString,
            fullname: "Emily",
            age: 25,
            profileImageUrls: [
                "https://images.unsplash.com/photo-1675709146139-c57b68bc44f6?q=80&w=1372&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
            ]
        ),
    ]
}
