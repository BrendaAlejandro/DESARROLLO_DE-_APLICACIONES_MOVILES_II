//
//  EazyShoesApp.swift
//  EazyShoes
//
//  Created by DAMII on 10/12/24.
//

import SwiftUI

@main
struct EazyShoesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
