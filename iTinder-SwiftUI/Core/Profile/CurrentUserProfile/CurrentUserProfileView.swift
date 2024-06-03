//
//  CurrentUserProfileVIew.swift
//  iTinder-SwiftUI
//
//  Created by Khondakar Afridi on 13/5/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @State private var showEditProfile = false
    let user: User
    var body: some View {
        NavigationView{
            List{
                CurrentUserProfileHeader(user: user)
                    .onTapGesture {
                        showEditProfile.toggle()
                    }
                Section("Account Settings"){
                    HStack{
                        Text("Name")
                        Spacer()
                        Text(user.fullname)
                    }
                    HStack{
                        Text("Email")
                        Spacer()
                        Text("jessie.m@gmail.com")
                    }
                }
                Section("Legal"){
                    Text("Terms of Service")
                }
                Section{
                    Button(action: {}, label: {
                        Text("Logout")  
                            .font(.subheadline)
                            .foregroundStyle(.red)
                    })
                }
                Section{
                    Button(action: {}, label: {
                        Text("Delete Account")
                            .font(.subheadline)
                            .foregroundStyle(.red)
                    })
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .fullScreenCover(isPresented: $showEditProfile, content: {
                EditProfileView(user: user)
            })
        }
    }
}

#Preview {
    CurrentUserProfileView(user: MockData.users.first!)
}
