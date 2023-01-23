//
//  TodoModel.swift
//  MyOrginizer
//
//  Created by Xenomorph on 1/22/23.
//

import Foundation

struct TodoModel: Identifiable {
	let id: String
	let title: String
	let dueDate: String
	let note: String?
	let isCompleted: Bool
	
	init(id: String = UUID().uuidString, title: String, dueDate: String, note: String?, isCompleted: Bool) {
		self.id = id
		self.title = title
		self.dueDate = dueDate
		self.note = note
		self.isCompleted = isCompleted
	}
}
