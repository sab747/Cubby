//
//  ContentView.swift
//  Shared
//
//  Created by Sabrina Jain on 6/24/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MainPage()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MainPage: View {
    var body: some View {
        NavigationView {
            List(0 ..< 3) { item in
                NavigationLink(destination: ListOfTasks()) {
                    Text("Placeholder")
                }
            }
            .navigationTitle("Cubby")
        }
    }
}

struct ListOfTasks: View {
    var toDoTasks : ToDoStore = ToDoStore()
    var body: some View {
        List {
            ForEach(toDoTasks.tasks) { task in
                NavigationLink( destination: Text("Hi there!")) {
                    Image(systemName: "circle")
                        .padding(.trailing)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    VStack() {
                        Text(task.description).padding()
                    }
                }
                
            }
        }
        .padding()
        .navigationTitle("Tasks")
    }
}
