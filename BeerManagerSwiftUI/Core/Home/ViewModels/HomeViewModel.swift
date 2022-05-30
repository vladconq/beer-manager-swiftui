//
//  HomeViewModel.swift
//  BeerManagerSwiftUI
//
//  Created by mainuser on 30.05.2022.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    // MARK: - PROPERTIES
    
    @Published var allBeers: [Beer] = []
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - SERVICES
    
    private let beerDataService = BeerDataService()
    
    // MARK: - INIT
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        beerDataService.$allBeers
            .sink { [weak self] returnedBeers in
                self?.allBeers = returnedBeers
            }
            .store(in: &cancellables)
    }
    
}
