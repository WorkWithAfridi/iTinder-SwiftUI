//
//  CardStackView.swift
//  iTinder-SwiftUI
//
//  Created by Khondakar Afridi on 9/5/24.
//

import SwiftUI

struct CardStackView: View {
    @StateObject var viewModel = CardsViewModel(service: CardService())
    var body: some View {
        VStack(spacing: 12){
            ZStack{
                ForEach(viewModel.cardModels){
                    card in
                    CardView(model: card, viewModel: viewModel)
                }
            }
            .onChange(of: viewModel.cardModels) { oldValue, newValue in
                print("DEBUG: Old value count: \(oldValue.count)")
                print("DEBUG: New value count: \(newValue.count)")
            }
            if !viewModel.cardModels.isEmpty {
                withAnimation {
                        SwipeActionButtonsView(viewModel: viewModel)
                            .padding(.bottom, 12)
                }
            }
        }
    }
}

#Preview {
    CardStackView()
}
