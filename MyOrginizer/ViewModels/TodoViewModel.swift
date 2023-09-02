//
//  TodoViewModel.swift
//  MyOrginizer
//
//  Created by Xenomorph on 1/22/23.
//

import Foundation

class TodoViewModel: ObservableObject {
    @Published var todoItems: [TodoModel] = [
        TodoModel(title: "First todo", dueDate: Date.now.addingTimeInterval(8400), note: nil, isCompleted: false),
        TodoModel(title: "Second todo", dueDate: Date.now.addingTimeInterval(-8400), note: "Notes for this item", isCompleted: true),
        TodoModel(title: "Third todo", dueDate: Date.now.addingTimeInterval(8400), note: nil, isCompleted: true)
    ]

    init() {
        //		getTodoItems()
    }

#if DEBUG
    init(todos: [TodoModel]) {
        todoItems.append(contentsOf: todos)
    }
#endif

    //	private func getTodoItems() {
    //		let newTodos = [
    //			TodoModel(title: "First todo", dueDate: Date.now.addingTimeInterval(8400), note: nil, isCompleted: false),
    //			TodoModel(title: "Second todo", dueDate: Date.now.addingTimeInterval(8400), note: "Notes for this item", isCompleted: true),
    //			TodoModel(title: "Third todo", dueDate: Date.now.addingTimeInterval(8400), note: nil, isCompleted: true)
    //		]
    //
    //		todoItems.append(contentsOf: newTodos)
    //	}

    func pastItems() -> [TodoModel] {
        todoItems.filter { todo in
            todo.dueDate < Date.now
        }
    }

    func lastSevenDays() -> [TodoModel] {
        todoItems.filter { todo in
            todo.dueDate >= Date.now && todo.dueDate <= addDays(addDays: 7)
        }
    }

    private func addDays(addDays: Int) -> Date {
        var dateComponent = DateComponents()
        dateComponent.day = addDays

        return Calendar.current.date(byAdding: dateComponent, to: Date.now) ?? Date.now
    }

    func deleteTodo(indexSet: IndexSet) {
        todoItems.remove(atOffsets: indexSet)
    }

    func moveTodo(from: IndexSet, to: Int) {
        todoItems.move(fromOffsets: from, toOffset: to)
    }
}
