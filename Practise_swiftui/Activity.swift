//
//  Activity.swift
//  Practise_swiftui
//
//  Created by Rose Visuals on 17/03/2026.
//

import SwiftUI

struct Activity: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool
}

struct ActivityListView: View {
//    had missed the " = "
//    changed the name of the variable cause it was a redeclaration in the same app
//    state changes , swiftui re renders all the views using that state
    @State private var pdts = [
        Activity(title: "read books", isCompleted: false),
        Activity(title: "play games", isCompleted: false)
    ]
    
    var body: some View{
        NavigationStack {
            VStack (spacing: 10) {
    //            its correct
    //            why the variable holding each item to be looped is different to avoid confusion
                ForEach($pdts){
                    $task in ActivityCardView (task : $task)
                }
            }
        }
        }
}

struct ActivityCardView: View {
//    was not calling the model
//    binding is a two way reference of state
    @Binding var task : Activity
    
    var body: some View {
        VStack {
//            had made a mistake and out task:title
                 Text(task.title)
                 Button("toggle") {
                     task.isCompleted.toggle()
                 }
         //        .backgroundColor(Color.black)
                 .tint(Color.green)
         //        used old logic here yet it has to be changing text directly when tapped
                 NavigationLink {
                     EditActivityView (task: $task)
//                     an error of trailing closure comes from an extra {} that has been added and not closed
                     } label: {
                         Text("Edit")
                     }
                 }
             }
        }
//


    struct EditActivityView: View {
        @Binding var task: Activity
        
        var body: some View{
            VStack (spacing: 20){
                TextField("Edit title", text: $task.title)
                    .textFieldStyle(.roundedBorder)
                Button("Toggle Complete") {
                    task.isCompleted.toggle()
                }
            }
            .navigationTitle("Edit Task")
            .padding()
        }
    }

//data flow is down from parent to child when state changes data flows up from the child to the parent via binding
#Preview {
    ActivityListView()
}
