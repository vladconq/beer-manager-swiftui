//
//  BeerManagerSwiftUIApp.swift
//  BeerManagerSwiftUI
//
//  Created by mainuser on 30.05.2022.
//

import SwiftUI

@main
struct BeerProManagerApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
            }
            .environmentObject(vm)
        }
    }
}
