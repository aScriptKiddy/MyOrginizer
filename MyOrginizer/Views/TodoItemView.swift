//
//  TodoItemView.swift
//  MyOrginizer
//
//  Created by Xenomorph on 1/22/23.
//

import SwiftUI

struct TodoItemView: View {
	
	@State var todoModel: TodoModel
	@State var showNote = false
	
    var body: some View {
		VStack {
			HStack {
				Image(systemName: "circle")
					.foregroundColor(.red)
				Text(todoModel.title)
				Spacer()
                Text("\(todoModel.dueDate.formatted(date: .abbreviated, time: .omitted))")
					.font(.caption)
			}
			
			if showNote {
				HStack {
					if let note = todoModel.note {
						Text(note)
							.padding(.horizontal, 28)
					}
					Spacer()
				}
			}
		}
		.onTapGesture {
			self.showNote.toggle()
			print("Clicked!!!")
//			TodoDetailView()
		}
    }
}

#if DEBUG
struct TodoItemView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationView {			
            TodoItemView(todoModel: TodoModel(title: "First todo", dueDate: Date.now.addingTimeInterval(8400), note: "", isCompleted: false))
		}
    }
}
#endif
