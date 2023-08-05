//
//  TableViewController.swift
//  To-Do List
//
//  Created by Yury Lebedev on 04/08/2023.
//

import UIKit

class TableViewController: UITableViewController {
    
    // MARK: - Properties
    private var toDoList = ToDoList.getToDoList() // Getting model
    
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.clearsSelectionOnViewWillAppear = false // Clear rows on selection
        navigationController?.navigationBar.prefersLargeTitles = true // Large title
        
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Creating and casting cell as custom cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        // Configure cell content
        cell.taskLabel.text = toDoList[indexPath.row].taskName
        cell.doneLabel.text = toDoList[indexPath.row].doneEmoji
        return cell
    }
    
    // Actions on selecting the rows
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let isTrue = toDoList[indexPath.row].isDone
        switch isTrue {
        case false:
            toDoList[indexPath.row].doneEmoji = "✅"
            tableView.reloadRows(at: [indexPath], with: .automatic)
            toDoList[indexPath.row].isDone = true
        case true:
            toDoList[indexPath.row].doneEmoji = "⚪️"
            tableView.reloadRows(at: [indexPath], with: .automatic)
            toDoList[indexPath.row].isDone = false
        }
        
    }
    
    // Remove row from leading side
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let remove = remove(at: indexPath)
        return UISwipeActionsConfiguration(actions: [remove])
    }
    
    // MARK: - Navigation
    @IBAction func unwindSegueTableVC(segue: UIStoryboardSegue) {
        guard let sourceVC = segue.source as? AddNewTaskViewController else { return }
        if segue.identifier == "saveSegue" {
            let indexPath = IndexPath(row: toDoList.count, section: 0)
            
            let sourceNewTask = sourceVC.addNewTaskTF.text ?? ""
            toDoList.append(ToDoList(taskName: sourceNewTask, isDone: false, doneEmoji: "⚪️"))
            tableView.insertRows(at: [indexPath], with: .top)
        }
        
    }
    
}

// MARK: Private Methods
extension TableViewController {
    
    // Func to remove action for leading swipe
    private func remove(at indexPath: IndexPath) -> UIContextualAction {
        let remove = UIContextualAction(style: .destructive, title: "Remove") { _, _, completion in
            self.toDoList.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        
        remove.image = UIImage(systemName: "trash.fill")
        remove.backgroundColor = .systemRed
        return remove
    }
    
}
