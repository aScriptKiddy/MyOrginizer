//
//  CalendarScreenView.swift
//  MyOrginizer
//
//  Created by Jeff Smith on 9/1/23.
//

import SwiftUI

struct CalendarScreenView: View {
    @State private var selectedDate = Date.now

    var body: some View {
        DatePicker("The Date", selection: $selectedDate)
            .datePickerStyle(.graphical)
    }
}

#Preview {
    CalendarScreenView()
}
