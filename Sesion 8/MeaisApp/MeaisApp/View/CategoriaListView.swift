//
//  CategoriaListView.swift
//  MeaisApp
//
//  Created by DAMII on 19/11/24.
//

import SwiftUI

struct CategoriaListView: View {

  @StateObject var viewModel: CategoriaListViewModel = CategoriaListViewModel()

  var body: some View {

    List {
      ForEach(viewModel.categories) { category in
        VStack {
          AsyncImage(url: URL(string: category.image))
          Text(category.name)
        }
      }
    }
    .onAppear {
      viewModel.getCategories()
    }

  }
}

#Preview {
  CategoriaListView()
}
