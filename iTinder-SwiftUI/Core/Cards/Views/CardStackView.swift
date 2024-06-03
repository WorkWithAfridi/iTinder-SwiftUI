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
        NavigationView{
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
//                if !viewModel.cardModels.isEmpty {
//                    withAnimation {
//                        SwipeActionButtonsView(viewModel: viewModel)
//                    }
//                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    HStack{
                        Image(systemName: "flame")
                        Text("iTinder")
                    }
                    .font(.title3)
                    .fontWeight(.bold)
                }
            })
        }
    }
}

#Preview {
    CardStackView()
}
