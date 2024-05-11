//
//  CardsViewModel.swift
//  iTinder-SwiftUI
//
//  Created by Khondakar Afridi on 9/5/24.
//

import Foundation

@MainActor
class CardsViewModel: ObservableObject{
    private let service: CardService
    @Published var buttonSwipeAction: SwipeAction?
    
    init(service: CardService){
        self.service = service
        Task{
            await fetchCardModels()
        }
    }
    
    @Published var cardModels = [CardModel]()
    
    func fetchCardModels() async {
        do {
            self.cardModels = try await service.fetchCardModels()
        } catch {
            print("DEBUG: Failed to fetch card models \(error.localizedDescription)")
        }
    }
    
    func removeCard(_ card: CardModel){
        Task{
           try await Task.sleep(nanoseconds: 500000000)
                guard let index = cardModels.firstIndex(where: { $0.id == card.id }) else { return }
                cardModels.remove(at: index)
        }
    }
}
