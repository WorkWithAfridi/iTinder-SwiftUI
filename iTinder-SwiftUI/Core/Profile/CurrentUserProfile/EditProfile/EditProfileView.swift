//
//  EditProfileView.swift
//  iTinder-SwiftUI
//
//  Created by Khondakar Afridi on 13/5/24.
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    let user: User
    var body: some View {
        NavigationStack{
            ScrollView {
                EditProfileImageGridView(user: user)
                    .padding()
            }
            .scrollIndicators(.hidden)
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Cancel")
                    })
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Done")
                            .fontWeight(.semibold)
                    })
                }
            }
        }
    }
}

#Preview {
    EditProfileView(user: MockData.users.first!)
}
