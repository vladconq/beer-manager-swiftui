//
//  HomeView.swift
//  BeerManagerSwiftUI
//
//  Created by mainuser on 30.05.2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    
    var body: some View {
        VStack {
            if vm.allBeers.isEmpty {
                ProgressView()
                    .padding(.top, 30)
                Spacer()
            } else {
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 12) {
                        ForEach(vm.allBeers) { beer in
                            Text("\(beer.name)")
                                .onAppear {
                                    if beer == self.vm.allBeers.last && !vm.isFinished {
                                        vm.fetchBeers()
                                    }
                                }
                            Rectangle()
                                .fill(.gray)
                                .opacity(0.4)
                                .frame(height: 0.5)
                        }
                        if !vm.isFinished {
                            progressView
                        }
                    }
                    .padding(.leading, 20)
                }
            }
        }
        .navigationTitle("All Beers")
        .onAppear() {
            vm.fetchBeers()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}

extension HomeView {
    
    private var progressView: some View {
        HStack {
            Spacer()
            ProgressView()
            Spacer()
        }
        .listRowSeparator(.hidden)
        .onAppear {
            print("aha")
        }
    }
    
}
