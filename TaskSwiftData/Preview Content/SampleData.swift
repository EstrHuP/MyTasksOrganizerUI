//
//  SampleData.swift
//  TaskSwiftData
//
//  Created by EstrHuP on 12/1/25.
//

import SwiftUI
import SwiftData

struct SampleData: PreviewModifier {
    
    static func makeSharedContext() async throws -> ModelContainer {
        let schema = Schema([Tasks.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: schema, configurations: modelConfiguration)
        
        let task1 = Tasks(id: UUID(),
                          title: "Do something in my project",
                          descriptionTask: "Do something cool",
                          status: .inProgress,
                          createdAt: .now,
                          updatedAt: .now)
        let task2 = Tasks(id: UUID(),
                          title: "Look 3D printers",
                          descriptionTask: "Paint the 3D printed figures",
                          status: .pending,
                          createdAt: .now,
                          updatedAt: .now)
        
        // Save example tasks
        container.mainContext.insert(task1)
        container.mainContext.insert(task2)
        
        return container
    }
    
    func body(content: Content, context: ModelContainer) -> some View {
        content.modelContainer(context)
    }
}

// Only show this code in preview content
extension PreviewTrait where T == Preview.ViewTraits {
    @MainActor static var sampleData: Self = .modifier(SampleData())
}
