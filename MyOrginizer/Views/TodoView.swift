//
//  TodoView.swift
//  MyOrginizer
//
//  Created by Xenomorph on 1/22/23.
//

import SwiftUI

struct TodoView: View {
    @StateObject var todoViewModel = TodoViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            List {
            Section("Next 7 days") {
                ForEach(todoViewModel.lastSevenDays()) { todo in
                    TodoItemView(todoModel: todo)
                }
                .onDelete(perform: todoViewModel.deleteTodo)
                .onMove(perform: todoViewModel.moveTodo)
            }

            Section("Past") {
                ForEach(todoViewModel.pastItems()) { todo in
                    TodoItemView(todoModel: todo)
                }
                .onDelete(perform: todoViewModel.deleteTodo)
                .onMove(perform: todoViewModel.moveTodo)
            }

            Spacer()
        }
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
        TodoModel(title: "First todo", dueDate: Date.now.addingTimeInterval(8400), note: nil, isCompleted: false),
        TodoModel(title: "Second todo", dueDate: Date.now.addingTimeInterval(8400), note: "This is a note", isCompleted: true),
        TodoModel(title: "Third todo", dueDate: Date.now.addingTimeInterval(8400), note: "FOO2", isCompleted: true)
        ]
    static let fakeTodoViewModel = TodoViewModel()

	static var previews: some View {
		NavigationView {
//			TodoView(todoViewModel: TodoViewModel(todos: newTodos))
            TodoView()
                .environmentObject(fakeTodoViewModel)
		}
	}
}
#endif
