//
//  TodoViewModel.swift
//  MyOrginizer
//
//  Created by Xenomorph on 1/22/23.
//

import Foundation

class TodoViewModel: ObservableObject {
	@Published var todoItems: [TodoModel] = []
	
	init() {
		getTodoItems()
	}
	
#if DEBUG
	init(todos: [TodoModel]) {
		todoItems.append(contentsOf: todos)
	}
#endif
	
	private func getTodoItems() {
		let newTodos = [
			TodoModel(title: "First todo", dueDate: "1/20/23", note: nil, isCompleted: false),
			TodoModel(title: "Second todo", dueDate: "1/23/23", note: "Notes for this item", isCompleted: true),
			TodoModel(title: "Third todo", dueDate: "1/21/23", note: nil, isCompleted: true)
		]
		
		todoItems.append(contentsOf: newTodos)
	}
	
	func deleteTodo(indexSet: IndexSet) {
		todoItems.remove(atOffsets: indexSet)
	}
	
	func moveTodo(from: IndexSet, to: Int) {
		todoItems.move(fromOffsets: from, toOffset: to)
	}
}
