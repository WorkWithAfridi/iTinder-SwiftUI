//
//  UserProfileView.swift
//  iTinder-SwiftUI
//
//  Created by Khondakar Afridi on 13/5/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserProfileView: View {
    @Environment(\.dismiss) var dismiss
    @State private var currentImageIndex = 0
    let user: User
    var body: some View {
        VStack {
            
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
            ScrollView{
                VStack {
                    ZStack (alignment: .top) {
                        WebImage(url: URL(string: user.profileImageUrls[currentImageIndex])) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ShimmerView()
                        }
                        .indicator(.activity)
                        .transition(.fade(duration: 0.5))
                        .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
                        .overlay {
                            ImageScrollingOverlay(currentImageIndex: $currentImageIndex, imageCount: user.profileImageUrls.count)
                        }
                        CardImageIndicatorView(currentImageIndex: currentImageIndex, imageCount: user.profileImageUrls.count)
                            .padding(.top, 8)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal, 12)
                    VStack(alignment: .leading, spacing: 12){
                        Text("About me")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Text("Aliquip pariatur adipisicing elit adipisicing enim cillum incididunt in esse. Lorem cillum adipisicing nisi exercitation culpa aliqua id eu. Deserunt sit quis magna excepteur et sint incididunt velit. Occaecat aute proident veniam nulla in aliqua deserunt consectetur commodo ex eu. Commodo elit et ex commodo duis voluptate anim et.")
                            .font(.subheadline)
                    }
                    .padding()
                    .background(.gray.opacity(0.05))
                    .font(.subheadline)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    VStack(alignment: .leading, spacing: 12){
                        Text("Essentials")
                            .font(.title3)
                            .fontWeight(.semibold)
                        HStack{
                            Image(systemName: "person")
                            Text("Women")
                            Spacer()
                        }
                        .font(.subheadline)
                        HStack{
                            Image(systemName: "arrow.down.forward.and.arrow.up.backward.circle")
                            Text("Straight")
                            Spacer()
                        }
                        .font(.subheadline)
                        HStack{
                            Image(systemName: "book")
                            Text("Actress")
                            Spacer()
                        }
                    }
                    .padding()
                    .background(.gray.opacity(0.05))
                    .font(.subheadline)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.horizontal, 12)

                }
            }
            
        }
    }
}

#Preview {
    UserProfileView(
        user:  MockData.users.first!)
}
