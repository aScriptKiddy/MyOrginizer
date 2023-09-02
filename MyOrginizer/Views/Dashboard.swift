//
//  Dashboard.swift
//  MyOrginizer
//
//  Created by Jeff Smith on 9/1/23.
//

import SwiftUI

struct Dashboard: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Jeff Smith")
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading)
                .cornerRadius(3.0)
                .background(Color.gray)

            NavigationLink {
                TodoView()
            } label: {
                Text("Todo")
            }
            .buttonStyle(.borderedProminent)
            .background(Color.red)
            .cornerRadius(5.0)

            NavigationLink {
                CalendarScreenView()
            } label: {
                Text("Calendar")
            }
            .buttonStyle(.borderedProminent)
            .background(Color.red)
            .cornerRadius(5.0)

            Spacer()
        }
        .navigationTitle("Dashboard")
    }
}

#Preview {
    Dashboard()
}
