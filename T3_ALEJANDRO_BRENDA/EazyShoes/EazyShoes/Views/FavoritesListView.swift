//
//  FavoritesListView.swift
//  EazyShoes
//
//  Created by DAMII on 10/12/24.
//

import SwiftUI

struct FavoritesListView: View {
    @EnvironmentObject var viewModel: ShoesListViewModel
    
    var body: some View {
        ZStack {
            // Fondo degradado
            LinearGradient(
                gradient: Gradient(colors: [Color.black, Color.gray]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                // Título estilizado
                Text("My Favorites")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.yellow)
                    .shadow(color: .black.opacity(0.6), radius: 4, x: 0, y: 2)
                    .padding(.top, 20)
                
                if viewModel.favorites.isEmpty {
                    Text("No favorites yet!")
                        .foregroundColor(.gray)
                        .font(.headline)
                        .padding(.top, 50)
                } else {
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(viewModel.favorites) { shoe in
                                HStack {
                                    // Imagen del zapato estilizada
                                    AsyncImage(url: URL(string: shoe.image)) { image in
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 80, height: 80)
                                            .cornerRadius(8)
                                            .shadow(color: .black.opacity(0.3), radius: 5)
                                    } placeholder: {
                                        ProgressView()
                                            .progressViewStyle(CircularProgressViewStyle(tint: .yellow))
                                    }
                                    
                                    // Información del zapato
                                    VStack(alignment: .leading, spacing: 6) {
                                        Text(shoe.name)
                                            .font(.headline)
                                            .foregroundColor(.white)
                                        Text(shoe.brand)
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                        Text("$\(shoe.price, specifier: "%.0f")")
                                            .font(.subheadline)
                                            .foregroundColor(.yellow)
                                    }
                                    
                                    Spacer()
                                    
                                    // Botón para eliminar de favoritos
                                    Button(action: {
                                        viewModel.removeFavorite(shoe: shoe)
                                    }) {
                                        Image(systemName: "trash.fill")
                                            .foregroundColor(.red)
                                            .font(.title2)
                                    }
                                    .padding(.leading)
                                }
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(
                                            LinearGradient(
                                                gradient: Gradient(colors: [Color.black.opacity(0.9), Color.gray.opacity(0.5)]),
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            )
                                        )
                                        .shadow(color: .black.opacity(0.3), radius: 6, x: 0, y: 4)
                                )
                                .padding(.horizontal)
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    FavoritesListView()
        .environmentObject(ShoesListViewModel())
}

