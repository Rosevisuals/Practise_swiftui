//
//  tasks.swift
//  Practise_swiftui
//
//  Created by Rose Visuals on 17/03/2026.
//
/// When using @State i need to use the model nothing else
/// @binding should be done to a model not a view
import SwiftUI

struct Tasks: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool
}

struct TaskListView: View {
    @State private var tasks = [
        Tasks(title: "do work", isCompleted: false),
        Tasks(title: "play games", isCompleted: true)
    ]
    var body: some View{
        VStack (spacing: 20){
            ForEach($tasks) {
                $task in TaskCardView(task: $task)
            }
        }
    }
}
struct TaskCardView: View {
    @Binding var task : Tasks
    
    var body: some View {
        Text(task.title)
            .padding()
        Button {
            task.isCompleted.toggle()
        }
        label: {
            Image(systemName: task.isCompleted ? "heart.filled" : "heart")
        }
    }
}

#Preview {
    TaskListView()
}
