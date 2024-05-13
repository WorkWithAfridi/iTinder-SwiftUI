//
//  CurrentUserProfileHeader.swift
//  iTinder-SwiftUI
//
//  Created by Khondakar Afridi on 13/5/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct CurrentUserProfileHeader: View {
    let user: User
    var body: some View {
        VStack{
            WebImage(url: URL(string: user.profileImageUrls.first!)) { image in
                ZStack (alignment: .topTrailing){
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .background(content: {
                            Circle()
                                .fill(.gray.opacity(0.35))
                                .frame(width: 128, height: 128)
                                .shadow(radius: 10)
                        })
                    .padding(.bottom, 4)
                    Image(systemName: "pencil")
                        .imageScale(.small)
                        .foregroundStyle(.gray)
                        .background {
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .offset(x: -8, y: 10)
                        
                }
            } placeholder: {
                ShimmerView()
            }
            .indicator(.activity)
            .transition(.fade(duration: 0.5))
            Text("\(user.fullname), \(user.age)")
                .font(.title2)
                .fontWeight(.light)
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: 240)
    }
}

#Preview {
    CurrentUserProfileHeader(user: MockData.users.first!)
}
