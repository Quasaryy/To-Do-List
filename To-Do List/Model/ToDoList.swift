//
//  todolist.swift
//  To-Do List
//
//  Created by Yury on 04/08/2023.
//
import UIKit

struct ToDoList {
    var taskName: String
    var isDone: Bool
}

extension ToDoList {
    static func getToDoList() -> [ToDoList] {
        [ToDoList(taskName: "My first task", isDone: false),
         ToDoList(taskName: "My first task", isDone: true)]
    }
}
