//
//  CardView.swift
//  iTinder-SwiftUI
//
//  Created by Khondakar Afridi on 18/4/24.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct CardView: View {
    let model: CardModel
    
    @ObservedObject var viewModel: CardsViewModel
    
    @State private var xOffset: CGFloat = 0
    @State private var yOffset: CGFloat = 0
    @State private var degree: Double = 0
    @State private var currentImageIndex = 0
    
    var body: some View {
        ZStack(alignment: .bottom){
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
                SwipeActionIndicatorView(
                    xOffset: $xOffset)
                    .padding()
                CardImageIndicatorView(currentImageIndex: currentImageIndex, imageCount: user.profileImageUrls.count)
                    .padding(.top, 8)
            }
            UserInfoView(user: user)
        }
        .onReceive(viewModel.$buttonSwipeAction, perform: { action in
            onReceiveSwipeAction(action)
        })
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding()
        .offset(
            x: xOffset
            //, y: yOffset
        )
        .rotationEffect(.degrees(degree))
        .animation(.bouncy, value: xOffset)
        .gesture(
            DragGesture()
                .onChanged({ value in
                    onDragChanged(value)
                })
                .onEnded({ value in
                    onDragEnded(value)
                })
        )
    }
}

private extension CardView{
    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value) {
        let width = value.translation.width
        if abs(width) <= abs(SizeConstants.screenCutOff) {
            returnToCenter()
            return
        }
        
        if width >= SizeConstants.screenCutOff {
            swipeRight()
        } else {
            swipeLeft()
        }
    }
    
    func onDragChanged(_ value: _ChangedGesture<DragGesture>.Value){
        withAnimation(.bouncy) {
            xOffset = value.translation.width
            // yOffset = value.translation.height
            degree = Double(value.translation.width / 25)
        }
    }
}

private extension CardView{
    func returnToCenter(){
        xOffset = 0
        degree = 0
    }
    
    func swipeRight(){
        withAnimation {
                xOffset = 500
                degree = 12
        } completion: {
            viewModel.removeCard(model)
        }
    }
    
    func swipeLeft(){
        withAnimation {
                xOffset = -500
                degree = -12
        } completion: {
            viewModel.removeCard(model)
        }
    }
    
    func onReceiveSwipeAction(_ action: SwipeAction?){
        guard let action else {return}
        let topCard = viewModel.cardModels.last
        if topCard == model {
            switch action {
            case .reject:
                swipeLeft()
            case .like:
                swipeRight()
            }
        }
        
    }
}

private extension CardView{
    var user: User{
        return model.user
    }
    
    var imageCount: Int {
        return user.profileImageUrls.count
    }
}


#Preview {
    CardView(
        model: CardModel(
            user: MockData.users.first!
        ),
        viewModel: CardsViewModel(
            service: CardService()
        )
    )
}
