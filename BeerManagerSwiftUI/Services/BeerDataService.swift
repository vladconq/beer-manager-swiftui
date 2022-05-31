//
//  BeerDataService.swift
//  BeerManagerSwiftUI
//
//  Created by mainuser on 30.05.2022.
//

import Foundation
import Combine

class BeerDataService {
    
    @Published var allBeers: [Beer] = []
    @Published var isFinished: Bool = false
    private var cancellables = Set<AnyCancellable>()
    
    func getBeers(for page: Int) {
        guard let url = URL(string: "https://api.punkapi.com/v2/beers?page=\(page)&per_page=20") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap({ output -> Data in
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            })
            .decode(type: [Beer].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(String(describing: error))
                }
            } receiveValue: { [weak self] returnedBeers in
                if returnedBeers.isEmpty {
                    self?.isFinished.toggle()
                } else {
                    self?.allBeers.append(contentsOf: returnedBeers)
                }
            }
            .store(in: &cancellables)
    }
    
}

