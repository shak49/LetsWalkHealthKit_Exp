//
//  Step.swift
//  LetsWalkHealthKit_Exp
//
//  Created by Shak Feizi on 8/12/22.
//

import Foundation


struct Step: Identifiable {
    let id: UUID = UUID()
    let count: Int
    let date: Date
}
