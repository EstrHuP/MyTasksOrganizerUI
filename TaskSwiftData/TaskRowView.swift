//
//  TaskRowView.swift
//  TaskSwiftData
//
//  Created by EstrHuP on 12/1/25.
//

import SwiftUI

struct TaskRowView: View {
    
    @State var task: Tasks
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(task.title)
                .font(.headline)
            HStack {
                Text(task.createdAt.formatted(date: .long,
                                              time: .omitted))
                .font(.subheadline)
                .foregroundStyle(.secondary)
                Spacer()
                HStack {
                    Circle()
                        .fill(task.status.color)
                        .frame(width: 16, height: 16)
                    Text(task.status.rawValue)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}
