//
//  ReminderView.swift
//  MakeItSo
//
//  Created by Marcel Mravec on 23.02.2024.
//

import SwiftUI

struct EditReminderDetailsView: View {
    enum FocusableField: Hashable {
        case title
    }
    
    @FocusState private var focusedField: FocusableField?
    enum Mode {
        case add
        case edit
    }
        
    var mode: Mode = .add
    
    @State var reminder = Reminder(title: "")
    
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
            .navigationTitle(mode == .add ? "New Reminder" : "Details")
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
            .onSubmit() {
                commit()
            }
        }
    }
}

struct EditReminderDetailsView_Previews: PreviewProvider {
  struct Container: View {
    @State var reminder = Reminder.samples[0]
    var body: some View {
      EditReminderDetailsView(mode: .edit, reminder: reminder) { reminder in
        print("You edited a reminder: \(reminder.title)")
      }
    }
  }
  
  static var previews: some View {
    EditReminderDetailsView { reminder in
      print("You added a reminder: \(reminder.title)")
    }
    Container()
  }
}
