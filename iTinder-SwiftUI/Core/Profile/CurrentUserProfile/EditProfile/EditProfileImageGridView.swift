//
//  EditProfileImageGridView.swift
//  iTinder-SwiftUI
//
//  Created by Khondakar Afridi on 13/5/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct EditProfileImageGridView: View {
    var user: User
    var body: some View {
        LazyVGrid(columns: columns,spacing: 16, content: {
            ForEach(0 ..< 6) {
                index in
                if index < user.profileImageUrls.count {
                    WebImage(url: URL(string: user.profileImageUrls[index])) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: imageWidth, height: imageHeight)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    } placeholder: {
                        ShimmerView()
                    }
                    .indicator(.activity)
                    .transition(.fade(duration: 0.5))
                } else {
                    ZStack (alignment: .bottomTrailing){
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.gray.opacity(0.25))
                            .frame(width: imageWidth, height: imageHeight)
                        Image(systemName: "plus.circle.fill")
                            .imageScale(.large)
                            .foregroundStyle(.red)
                            .offset(x: 4, y: 4)
                    }
                }
            }
        })
    }
}

private extension EditProfileImageGridView {
    private var columns: [GridItem] {
        [
            .init(.flexible()),
            .init(.flexible()),
            .init(.flexible())
        ]
    }
    
    var imageWidth: CGFloat {
        return 110
    }
    var imageHeight: CGFloat {
        return 160
    }
}

#Preview {
    EditProfileImageGridView(user: MockData.users.first!)
}
