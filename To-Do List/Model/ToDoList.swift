//
//  todolist.swift
//  To-Do List
//
//  Created by Yury on 04/08/2023.
//

struct ToDoList {
    var taskName: String
    var isDone: Bool
    var doneEmoji: String
}

extension ToDoList {
    static func getToDoList() -> [ToDoList] {
        [ToDoList(taskName: "My first task", isDone: false, doneEmoji: "⚪️")]
    }
}
