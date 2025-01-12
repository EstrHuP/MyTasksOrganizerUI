//
//  AddTaskView.swift
//  TaskSwiftData
//
//  Created by EstrHuP on 12/1/25.
//

import SwiftUI

struct AddTaskView: View {
    // To close this view
    @Environment(\.dismiss) private var dismiss
    // Insert value to database
    @Environment(\.modelContext) private var context
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var dateCreated: Date = Date()
    @State private var status: StatusTask = .pending
    
    var body: some View {
        NavigationStack {
            Form {
                VStack(alignment: .leading) {
                    Text("Title")
                        .font(.headline)
                        .padding(.leading, 5)
                    TextField("Enter title task", text: $title)
                }
                VStack(alignment: .leading) {
                    Text("Description")
                        .font(.headline)
                        .padding(.leading, 5)
                    TextField("Enter the description task", text: $description)
                }
                VStack(alignment: .leading) {
                    DatePicker(selection: $dateCreated,
                               displayedComponents: .date) {
                        Text("Initial date")
                            .font(.headline)
                            .padding(.leading, 5)
                    }
                }
                VStack(alignment: .leading) {
                    Picker("Select status", selection: $status) {
                        ForEach(StatusTask.allCases) { status in
                            Text(status.rawValue).tag(status)
                        }
                    }
                    .font(.headline)
                    .padding(.leading, 5)
                }
            }
            .textFieldStyle(.roundedBorder)
            .navigationTitle("New Task")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        let newTask = Tasks(id: UUID(),
                                            title: title,
                                            descriptionTask: description,
                                            status: status,
                                            createdAt: dateCreated,
                                            updatedAt: Date())
                        context.insert(newTask)
                        dismiss()
                    } label: {
                        Text("Create")
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
            }
        }
    }
}

#Preview {
    AddTaskView()
}
