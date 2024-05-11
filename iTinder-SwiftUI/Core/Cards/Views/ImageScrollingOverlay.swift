//
//  ImageScrollingOverlay.swift
//  iTinder-SwiftUI
//
//  Created by Khondakar Afridi on 9/5/24.
//

import SwiftUI

struct ImageScrollingOverlay: View {
    @Binding var currentImageIndex: Int
    let imageCount: Int
    var body: some View {
        HStack{
            Rectangle()
                .onTapGesture {
                    updateImageIndex(shouldIncrement: false)
                }
            Rectangle()
                .onTapGesture {
                    updateImageIndex(shouldIncrement: true)
                }
        }.foregroundStyle(.white.opacity(0.01))
    }
}

private extension ImageScrollingOverlay{
    func updateImageIndex(shouldIncrement: Bool){
        if shouldIncrement {
            guard currentImageIndex < (imageCount - 1 ) else {return}
            currentImageIndex += 1

        } else {
            guard currentImageIndex > 0 else { return }
            currentImageIndex -= 1
        }
    }
}

#Preview {
    ImageScrollingOverlay(
        currentImageIndex: .constant(1),
    imageCount: 1)
}
