//
//  ShoesListView.swift
//  EazyShoes
//
//  Created by DAMII on 10/12/24.
//

import SwiftUI

struct ShoesListView: View {
    @EnvironmentObject var viewModel: ShoesListViewModel
    @State private var selectedCategory: String = "WOMEN"
    
    var body: some View {
        VStack {
            // Título estilizado
            Text("EazyShoes")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.yellow)
                .shadow(color: .black.opacity(0.6), radius: 4, x: 0, y: 2)
                .padding(.top, 20)
            
            // Picker estilizado con degradado
            Picker("Category", selection: $selectedCategory) {
                Text("Women").tag("WOMEN")
                Text("Men").tag("MEN")
                Text("Kids").tag("KIDS")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.black.opacity(0.8), Color.gray.opacity(0.5)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .shadow(color: .black.opacity(0.4), radius: 8, x: 0, y: 4)
            )
            .onChange(of: selectedCategory) { newCategory in
                viewModel.getShoes(for: newCategory)
            }
            
            // Lista de zapatos
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.shoes) { shoe in
                        HStack {
                            // Imagen del zapato estilizada
                            AsyncImage(url: URL(string: shoe.image)) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(10)
                                    .shadow(color: .black.opacity(0.2), radius: 5)
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 100, height: 100)
                                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                            }
                            
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
                            
                            // Botón de favorito estilizado
                            Button(action: {
                                viewModel.toggleFavorite(shoe: shoe)
                            }) {
                                Image(systemName: shoe.isFavorite ? "heart.fill" : "heart")
                                    .foregroundColor(shoe.isFavorite ? .red : .gray)
                                    .font(.title)
                                    .scaleEffect(shoe.isFavorite ? 1.3 : 1.0)
                                    .animation(.easeInOut(duration: 0.2), value: shoe.isFavorite)
                            }
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
                .padding(.top)
            }
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.black, Color.gray]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
        )
        .onAppear {
            viewModel.getShoes(for: selectedCategory)
        }
    }
}

#Preview {
    ShoesListView()
}

