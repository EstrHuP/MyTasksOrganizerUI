//
//  ContentView.swift
//  TaskSwiftData
//
//  Created by EstrHuP on 10/1/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    // Get data from database
    @Query private var tasks: [Tasks]
    @State private var isShowAddButton: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                if tasks.isEmpty {
                    ContentUnavailableView("Tasks are empty",
                                           systemImage: "list.bullet.clipboard",
                                           description: Text("Please create a new task to continue"))
                } else {
                    main
                }
            }
            .fullScreenCover(isPresented: $isShowAddButton) { AddTaskView() }
            .navigationTitle("Tasks")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        isShowAddButton.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    
    var main: some View {
        List {
            ForEach(tasks) { task in
                TaskRowView(task: task)
            }
            .onDelete { index in
                if let taskIndex = index.first {
                    context.delete(tasks[taskIndex])
                }
            }
        }
    }
}

#Preview(traits: .sampleData) {
    ContentView()
}
