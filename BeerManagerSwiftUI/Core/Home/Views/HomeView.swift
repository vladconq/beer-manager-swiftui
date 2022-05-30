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
        List {
            ForEach(vm.allBeers) { beer in
                Text("\(beer.name)")
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("All Beers")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}
