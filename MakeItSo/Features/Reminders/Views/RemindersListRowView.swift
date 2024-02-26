//
//  RemindersListRowView.swift
//  MakeItSo
//
//  Created by Marcel Mravec on 23.02.2024.
//

import SwiftUI

struct RemindersListRowView: View {
    @Binding var reminder: Reminder
    var body: some View {
        HStack {
            Toggle(isOn: $reminder.isCompleted) { /* empty on purpose */ }
                .toggleStyle(.reminder)
            Text(reminder.title)
        }
    }
}

struct RemindersListRowView_Previews: PreviewProvider {
  struct Container: View {
    @State var reminder = Reminder.samples[0]
    var body: some View {
        List {
            RemindersListRowView(reminder: $reminder)
        }
        .listStyle(.plain)
    }
  }
    
  static var previews: some View {
      NavigationStack {
          Container()
              .navigationTitle("Reminders")
      }
  }
}
