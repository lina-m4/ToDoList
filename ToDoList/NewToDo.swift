//
//  NewToDo.swift
//  ToDoList
//
//  Created by Lina Mered on 7/28/25.
//

import SwiftUI
import SwiftData

struct NewToDo: View {
    
    @Binding var showNewTask: Bool
    @Bindable var toDoItem: ToDoItem
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        VStack {
            Text("Task title:")
                .font(.title)
                .fontWeight(.bold)
            TextField("Enter description here...", text: $toDoItem.title, axis: .vertical)
                .padding()
                .background(Color(.systemGroupedBackground))
                .cornerRadius(15)
                .padding()
            Toggle(isOn: $toDoItem.isImportant) {
                Text("Is it important?")
            }
            Button {
                addToDo()
                showNewTask = false
            } label: {
                Text("Save")
                    .fontWeight(.bold)
            }
            
        }
        .padding()
    }
    func addToDo() {
        let toDo = ToDoItem(title: toDoItem.title, isImportant: toDoItem.isImportant)
        modelContext.insert(toDo)

    }
}

#Preview {
    NewToDo(showNewTask: .constant(false), toDoItem: ToDoItem(title: "", isImportant: false))
}
