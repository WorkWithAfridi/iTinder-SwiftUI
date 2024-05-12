//
//  UserProfileView.swift
//  iTinder-SwiftUI
//
//  Created by Khondakar Afridi on 13/5/24.
//

import SwiftUI

struct UserProfileView: View {
    @Environment(\.dismiss) var dismiss
    let user: User
    var body: some View {
        HStack{
            Text(user.fullname)
                .font(.title2)
                .fontWeight(.semibold)
            Text("\(user.age)")
                .font(.title2)
            Spacer()
            Button(action: {dismiss()}, label: {
                Image(systemName: "arrow.down.circle.fill")
                    .imageScale(.large)
                    .fontWeight(.bold)
                    .foregroundStyle(.primary)
            })
        }
        .padding(.horizontal)
    }
}

#Preview {
    UserProfileView(
        user:  MockData.users.first!)
}
