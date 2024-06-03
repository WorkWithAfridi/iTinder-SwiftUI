//
//  EditProfileView.swift
//  iTinder-SwiftUI
//
//  Created by Khondakar Afridi on 13/5/24.
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @State var userBio: String = ""
    @State private var showGenderSheet = false
    @State private var selectedGender = "Man"
    @State private var showSexualOrientationSheet = false
    @State private var selectedSexualOrientation = "Straight"
    
    let user: User
    var body: some View {
        NavigationView{
            ScrollView {
                EditProfileImageGridView(user: user)
                    .padding()
                VStack (spacing: 24){
                    VStack(alignment: .leading){
                        Text("About Me".uppercased())
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.leading)
                        TextField("Add your bio", text: $userBio, axis: .vertical)
                            .padding()
                            .frame(height: 100, alignment: .top)
                            .background(Color(.secondarySystemBackground))
                            .font(.subheadline)
                    }
                    VStack(alignment: .leading){
                        Text("Occupation".uppercased())
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.leading)
                        HStack{
                            Image(systemName: "book")
                            Text("Occupation")
                            Spacer()
                            Text("Lecturer | Teacher")
                                .font(.footnote)
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .font(.subheadline)
                    }
                    VStack(alignment: .leading){
                        Text("Gender".uppercased())
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.leading)
                        HStack{
                            Image(systemName: "person.fill.questionmark")
                            Text("Gender")
                            Spacer()
                            Text(selectedGender)
                            Image(systemName: "chevron.right")
                                .imageScale(.small)
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .font(.subheadline)
                        .onTapGesture {
                            showGenderSheet.toggle()
                        }
                    }
                    VStack(alignment: .leading){
                        Text("Sexual Orientation".uppercased())
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.leading)
                        HStack{
                            Text(selectedSexualOrientation)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .imageScale(.small)
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .font(.subheadline)
                        .onTapGesture {
                            showSexualOrientationSheet.toggle()
                        }
                    }
                }
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
            .sheet(isPresented: $showGenderSheet) {
                SelectGenderBottomSheet(selectedGender: $selectedGender)
            }
            .sheet(isPresented: $showSexualOrientationSheet) {
                SelectSexualOrientationBottomSheet(selectedOrientation: $selectedSexualOrientation)
            }
        }
    }
}

#Preview {
    EditProfileView(user: MockData.users.first!)
}



struct SelectGenderBottomSheet: View {
    @Binding var selectedGender: String
    @Environment(\.presentationMode) var presentationMode
    
    let sex = ["Man", "Woman", "Others"]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Select Gender")){
                    ForEach(sex, id: \.self) { orientation in
                        Text(orientation)
                            .onTapGesture {
                                selectedGender = orientation
                                presentationMode.wrappedValue.dismiss()
                            }
                    }
                }
            }
            .navigationTitle("Gender")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            }, trailing: Button("Done") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct SelectSexualOrientationBottomSheet: View {
    @Binding var selectedOrientation: String
    @Environment(\.presentationMode) var presentationMode
    
    let orientations = ["Straight", "Gay", "Lesbian", "Bisexual", "Asexual", "Demisexual", "Pansexual", "Queer", "Questioning"]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Select Sexual Orientation")){
                    ForEach(orientations, id: \.self) { orientation in
                        Text(orientation)
                            .onTapGesture {
                                selectedOrientation = orientation
                                presentationMode.wrappedValue.dismiss()
                            }
                    }
                }
            }
            .navigationTitle("Orientation")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            }, trailing: Button("Done") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}
