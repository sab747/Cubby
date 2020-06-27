//
//  taskRowCell.swift
//  Cubby
//
//  Created by Sabrina Jain on 6/27/20.
//

import Foundation
import SwiftUI

struct taskRowCell: View {
    @State private var name = ""
    var task : Task
    var body: some View {
        NavigationLink( destination: Text("Hi there!")) {
            Image(systemName: "circle")
                .padding(.trailing)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            if task.titled {
                Text(task.description).padding()
            }
            else {
                TextField("Enter task here", text : $name)
            }
            
        }
    }
}
