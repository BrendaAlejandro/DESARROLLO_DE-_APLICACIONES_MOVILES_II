//
//  HomeView.swift
//  EazyShoes
//
//  Created by DAMII on 10/12/24.
//

//
//  HomeView.swift
//  EazyShoes
//
//  Created by DAMII on 10/12/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = ShoesListViewModel()

    var body: some View {
        ZStack {
            // Fondo negro completo
            Color.black
                .edgesIgnoringSafeArea(.all)

            TabView {
                ShoesListView()
                    .tabItem {
                        Label("Shoes", systemImage: "shoe.fill")
                    }
                    .environmentObject(viewModel)

                FavoritesListView()
                    .tabItem {
                        Label("Favorites", systemImage: "heart.fill")
                    }
                    .environmentObject(viewModel)
            }
            .accentColor(.yellow) // Color de selección de tabuladores
            .background(Color.black.edgesIgnoringSafeArea(.all)) // Fondo del TabView negro
        }
    }
}

#Preview {
    HomeView()
}


