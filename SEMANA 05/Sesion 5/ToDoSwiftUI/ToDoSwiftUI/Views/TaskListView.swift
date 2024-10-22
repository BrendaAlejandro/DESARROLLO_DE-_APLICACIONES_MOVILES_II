//
//  ContentView.swift
//  ToDoSwiftUI
//
//  Created by DAMII on 15/10/24.
//

import SwiftUI

struct TaskListView: View {
    @State  var tasks : [Task] = []



    var body: some View {
        NavigationStack {
            List{
                ForEach(tasks){task in
                    Text(task.title)
                }.onDelete(perform: { indexSet in
                    self.tasks.remove( atOffsets: indexSet)
            
                })
            }
            .navigationTitle("Tasks")  //titulo de la navegacion
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    NavigationLink(destination: { //con esto creas otra vista  {} - > ahi se pone el nomnre de la otra vista
                        TaskDetailWiew{ task in
                            tasks.append(task)
                        }
                    }){
                        Image (systemName: "plus")
                    }
                    }
                }
        }
        .padding()
    }
}

#Preview {
    TaskListView()
}

