//
//  DataModel.swift
//  TaskSwiftData
//
//  Created by EstrHuP on 12/1/25.
//

import Foundation
import SwiftData
import SwiftUICore

enum StatusTask: String, Codable, CaseIterable, Identifiable {
    var id: Self { self }
    case pending = "Pending"
    case inProgress = "In progress"
    case finished = "Finished"
    
    var color: Color {
        switch self {
        case .pending: return .orange
        case .inProgress: return .yellow
        case .finished: return .green
        }
    }
}

@Model
final class Tasks {
    @Attribute(.unique) var id: UUID
    var title: String
    var descriptionTask: String
    var status: StatusTask
    var createdAt: Date
    var updatedAt: Date
    
    init(id: UUID, title: String, descriptionTask: String, status: StatusTask, createdAt: Date, updatedAt: Date) {
        self.id = id
        self.title = title
        self.descriptionTask = descriptionTask
        self.status = status
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
