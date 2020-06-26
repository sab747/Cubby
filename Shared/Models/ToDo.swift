//
//  ToDo.swift
//  Cubby
//
//  Created by Sabrina Jain on 6/25/20.
//  Contains classes and structs for the ToDoView
//

import Foundation

/*
 ToDo
 
 Type of page. A to-do list page (duhhhh)
 */
class ToDo : PageType {
    var toDoLists : [ToDoStore]
    
    init() {
        toDoLists = [ToDoStore]()
        super.init("TODO")
    }
}

/*
 ToDoStore
 
 Holds a list of tasks. Each ToDoStore will eventually align with one ToDoView
 */
class ToDoStore : ObservableObject {
    
    //Variables
    @Published var tasks : [Task]
    
    init() {
        tasks = []
        self.addTask("Hello")
    }
    
    func addTask (_ taskDescrip : String) {
        tasks.append(Task(taskDescrip))
    }
    
    func removeTask (_ task : Task) {
        if tasks.contains(task) {
            tasks.remove(at: tasks.firstIndex(of: task)!)
        }
    }
}

/*
 Task
 
 Holds one to-do task
 */
struct Task : Identifiable, Equatable {
    
    //Parameters
    var id: UUID //unique identifier
    var description : String //to-do task
    //TO-DO (hahahahah) : add more details so that user can click on task and see more
    
    //Constructor
    init (_ description : String) {
        self.description = description
        self.id = UUID()
    }
}
