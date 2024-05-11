//
//  CardImageIndicatorView.swift
//  iTinder-SwiftUI
//
//  Created by Khondakar Afridi on 9/5/24.
//

import SwiftUI

struct CardImageIndicatorView: View {
    let currentImageIndex: Int
    let imageCount: Int
    
    var body: some View {
        HStack{
            ForEach(0..<imageCount, id: \.self){
                index in
                Capsule()
                    .frame(width: (UIScreen.main.bounds.width / CGFloat(imageCount))  * 0.5 , height: 4)
                    .foregroundStyle(currentImageIndex == index ? .black : .white)
            }
        }
    }
}

#Preview {
    CardImageIndicatorView(currentImageIndex: 1, imageCount: 3)
}
