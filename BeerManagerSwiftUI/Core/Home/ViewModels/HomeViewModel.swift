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
    @Published var isFetching: Bool = false
    @Published var isFinished: Bool = false
    
    var currentPage: Int = 1
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - SERVICES
    
    private let beerDataService = BeerDataService()
    
    // MARK: - INIT
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        beerDataService.$allBeers
            .combineLatest(beerDataService.$isFinished)
            .sink { [weak self] returnedBeers, isFinished in
                self?.allBeers = returnedBeers
                if isFinished {
                    self?.isFinished.toggle()
                }
            }
            .store(in: &cancellables)
    }
    
    func fetchBeers() {
        isFetching = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.beerDataService.getBeers(for: self.currentPage)
            self.isFetching = false
            self.currentPage += 1
        }
    }
    
}
