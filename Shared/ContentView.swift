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
            MainPage()
        }
        
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
    var body: some View {
        List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
            NavigationLink( destination: Text("Hi there!")) {
                Image(systemName: "circle")
                    .padding(.trailing)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                VStack() {
                    Text("Task").padding()
                    Text("Task Type")
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.leading)
                }
            }
            
        }
        .padding()
        .navigationTitle("Tasks")
    }
}
