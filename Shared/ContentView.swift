//
//  ContentView.swift
//  Shared
//
//  Created by Sabrina Jain on 6/24/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ListOfTasks()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ListOfTasks: View {
    var body: some View {
        List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
            NavigationLink( destination: Text("Hi there!")) {
                Image(systemName: "circle")
                VStack {
                    Text("Task").padding()
                    Text("Task Type")
                }
            }
            
        }
        .navigationTitle("Tasks")
    }
}
