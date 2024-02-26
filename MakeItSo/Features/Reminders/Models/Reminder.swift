//
//  Reminder.swift
//  MakeItSo
//
//  Created by Marcel Mravec on 23.02.2024.
//

import Foundation


struct Reminder: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted = false
}


extension Reminder {
  static let samples = [
    Reminder(title: "Build sample app", isCompleted: true),
    Reminder(title: "Create tutorial"),
    Reminder(title: "???"),
    Reminder(title: "PROFIT!"),
  ]
}
