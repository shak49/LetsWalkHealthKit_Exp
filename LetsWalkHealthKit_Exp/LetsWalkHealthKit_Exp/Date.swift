//
//  Date.swift
//  LetsWalkHealthKit_Exp
//
//  Created by Shak Feizi on 8/11/22.
//

import Foundation


extension Date {
    static func mondayAt12AM() -> Date {
        return Calendar(identifier: .iso8601).date(from: Calendar(identifier: .iso8601).dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date()))!
    }
}
