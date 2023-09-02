//
//  DateExtension.swift
//  MyOrginizer
//
//  Created by Jeff Smith on 9/1/23.
//

import Foundation
extension Date {
    var sevenDaysOut: Date {
        Calendar.autoupdatingCurrent.date(byAdding: .day, value: 7, to: self) ?? self
    }

    var thirtyDaysOut: Date {
        Calendar.autoupdatingCurrent.date(byAdding: .day, value: 30, to: self) ?? self
    }
}
