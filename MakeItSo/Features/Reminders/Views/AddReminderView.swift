//
//  ReminderView.swift
//  MakeItSo
//
//  Created by Marcel Mravec on 23.02.2024.
//

import SwiftUI

struct AddReminderView: View {
    enum FocusableField: Hashable {
        case title
    }
    
    @FocusState private var focusedField: FocusableField?
    @State private var reminder = Reminder(title: "")
    
    var onCommit: (_ reminder: Reminder) -> Void
    @Environment(\.dismiss) private var dismiss
    
    private func commit() {
        onCommit(reminder)
        dismiss()
    }
    
    private func cancel() {
        dismiss()
    }
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $reminder.title)
            }
            .navigationTitle("New Reminder")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: cancel) {
                        Text("Cancel")
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: commit) {
                        Text("Add")
                    }
                    .disabled(reminder.title.isEmpty || reminder.title.count < 2)
                }
            }
            .onAppear {
                focusedField = .title
            }
        }
    }
}

#Preview {
    AddReminderView { reminder in
        print("You have added a new reminder titled: \(reminder.title)")
    }
}
