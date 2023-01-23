//
//  TodoView.swift
//  MyOrginizer
//
//  Created by Xenomorph on 1/22/23.
//

import SwiftUI

struct TodoView: View {
	@State var todoViewModel = TodoViewModel()
	
	var body: some View {
		List {
			ForEach(todoViewModel.todoItems) { todo in
				TodoItemView(todoModel: todo)
			}
			.onDelete(perform: todoViewModel.deleteTodo)
			.onMove(perform: todoViewModel.moveTodo)
		}
		.navigationTitle("Todo List")
		.navigationBarTitleDisplayMode(.large)
		.navigationBarHidden(false)
		.navigationBarItems(leading: leadingNav(), trailing: Text("Add"))
	}
}


struct leadingNav: View {
	var body: some View {
		VStack {
			EditButton()
		}
	}
}

#if DEBUG
struct TodoView_Previews: PreviewProvider {
	static let newTodos = [
		TodoModel(title: "First todo", dueDate: "1/20/23", note: nil, isCompleted: false),
		TodoModel(title: "Second todo", dueDate: "1/23/23", note: "This is a note", isCompleted: true),
		TodoModel(title: "Third todo", dueDate: "1/21/23", note: "FOO2", isCompleted: true)
	]
	static var previews: some View {
		NavigationView {
			TodoView(todoViewModel: TodoViewModel(todos: newTodos))
		}
	}
}
#endif
