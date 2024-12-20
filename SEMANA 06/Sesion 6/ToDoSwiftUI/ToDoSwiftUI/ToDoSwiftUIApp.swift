//
//  ToDoSwiftUIApp.swift
//  ToDoSwiftUI
//
//  Created by DAMII on 15/10/24.
//

import SwiftUI
import CoreData

@main
struct ToDoSwiftUIApp: App {
    let persisteceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            TaskListView()
        }
    }
}
