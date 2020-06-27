//
//  ContentView.swift
//  Shared
//
//  Created by Sabrina Jain on 6/24/20.
//

import SwiftUI

struct ContentView: View {
    
    @Environment (\.managedObjectContext) var moc
    @FetchRequest(entity: ToDoList.entity(), sortDescriptors:[]) var lists: FetchedResults<ToDoList>
    
    var body: some View {
        NavigationView {
            List {
                if lists.isEmpty {
                    Text("No Lists - Please add a list")
                }
                ForEach(lists) { tdList in
                    NavigationLink(destination: ListOfTasks().environment(\.managedObjectContext, self.moc)) {
                        Text(tdList.name!)
                    }
                }.onDelete(perform: removeList)
            }
            .navigationBarTitle("Cubby")
            .navigationBarItems(trailing: Button(action: {addList()},
                label: {
                Image(systemName: "plus")
            }))
        }
    }
    
    func addList () {
        let newList = ToDoList(context: moc)
        newList.id = UUID()
        newList.name = "New list"
        
        do {
            try moc.save()
        } catch {
            print(error)
        }
    }
    
    func removeList (at offsets: IndexSet) {
        for index in offsets {
        let tdList = lists[index]
                moc.delete(tdList)
        }
        do {
            try moc.save()
        } catch {
            print(error)
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
            .navigationBarTitle("Cubby")
        }
    }
}

struct ListOfTasks: View {
    @ObservedObject var toDoTasks : ToDoStore = ToDoStore()
    @State private var descrip: String = "Tim"
    var body: some View {
        List {
            ForEach(toDoTasks.tasks) { task in
                taskRowCell(task: task)
            }
        }
        .padding()
        .navigationBarTitle("Tasks")
        .navigationBarItems(trailing: Button(action: {
            toDoTasks.addTask("New Task")
        }) {
            Image(systemName: "plus")
        })
    }
}


