//
//  ContentView.swift
//  MyOrginizer
//
//  Created by Xenomorph on 1/22/23.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		NavigationStack {
			List {
				NavigationLink("ToDo List") {
					TodoView()
				}
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			ContentView()
		}
	}
}
