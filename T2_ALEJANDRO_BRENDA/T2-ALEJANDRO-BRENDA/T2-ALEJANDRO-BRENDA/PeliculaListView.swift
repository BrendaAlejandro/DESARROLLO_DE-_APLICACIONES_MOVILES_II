//
//  PeliculaListView.swift
//  T2-ALEJANDRO-BRENDA
//
//  Created by DAMII on 26/11/24.
//

import SwiftUI

struct PeliculaListView: View {
    @StateObject var viewModel: PeliculaListViewModel = PeliculaListViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.peliculas) { pelicula in
                VStack(alignment: .leading) {
                    if let url = URL(string: "https://image.tmdb.org/t/p/w500\(pelicula.poster_path)") {
                        AsyncImage(url: url) { image in
                            image.resizable().scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                        .cornerRadius(8)
                        .shadow(radius: 5)
                    }
                    
                    Text(pelicula.title)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.top, 5)
                    
                    Text(pelicula.overview)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .lineLimit(3)
                        .truncationMode(.tail)
                        .padding(.top, 2)
                    
                    HStack {
                        Text("Rating: \(pelicula.vote_average, specifier: "%.1f")")
                            .font(.footnote)
                            .foregroundColor(.yellow)
                        
                        Text("(\(pelicula.vote_count) votes)")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    .padding(.top, 5)
                }
                .padding()
                .background(Color.black.opacity(0.8))  // Fondo oscuro para cada bloque
                .cornerRadius(12)
                .shadow(color: Color.black.opacity(0.7), radius: 5, x: 0, y: 5)
                .padding(.vertical, 5)
            }
            .onAppear {
                viewModel.obtenerPeliculas()
            }
            .background(Color.black)  // Fondo negro general para la vista
            .navigationTitle("Películas Populares")
        }
        .preferredColorScheme(.dark)
    }
}

struct PeliculaListView_Previews: PreviewProvider {
    static var previews: some View {
        PeliculaListView()
            .preferredColorScheme(.dark)
    }
}
