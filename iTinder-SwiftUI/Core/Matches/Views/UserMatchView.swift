//
//  UserMatchView.swift
//  iTinder-SwiftUI
//
//  Created by Khondakar Afridi on 3/6/24.
//

import SwiftUI
import SDWebImageSwiftUI


struct UserMatchView: View {
    @Binding var show: Bool
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.black.opacity(0.7))
                .ignoresSafeArea()
            VStack(spacing: 120){
                VStack{
                    Text("Its a match".uppercased())
                        .font(.title)
                    Text("You and Anusha have liked each other.")
                        .foregroundStyle(.white)
                }
                HStack(spacing: 16){
                    WebImage(url: URL(string: MockData.users[2].profileImageUrls.first!)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 120)
                                .clipShape(Circle())
                                .overlay{
                                    Circle()
                                        .stroke(.white, lineWidth: 2)
                                        .shadow(radius: 4)
                                }
                            .padding(.bottom, 4)
                        } placeholder: {
                            ShimmerView()
                        }
                        .indicator(.activity)
                        .transition(.fade(duration: 0.5))
                    WebImage(url: URL(string: MockData.users[0].profileImageUrls.first!)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 120)
                                .clipShape(Circle())
                                .overlay{
                                    Circle()
                                        .stroke(.white, lineWidth: 2)
                                        .shadow(radius: 4)
                                }
                            .padding(.bottom, 4)
                        } placeholder: {
                            ShimmerView()
                        }
                        .indicator(.activity)
                        .transition(.fade(duration: 0.5))
                }
                VStack(spacing: 16){
                    Button("Send Message"){}
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 350, height: 44)
                        .background(Color(.systemPink))
                        .clipShape(Capsule())
                    Button("Keep Swiping "){}
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 350, height: 44)
                        .background(.clear)
                        .clipShape(Capsule())
                        .overlay{
                            Capsule()
                                .stroke(.white, lineWidth: 2)
                                .shadow(radius: 4)
                        }
                }
            }
        }
    }
}

#Preview {
    UserMatchView(show: .constant(true))
}
