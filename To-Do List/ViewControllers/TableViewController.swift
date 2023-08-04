//
//  TableViewController.swift
//  To-Do List
//
//  Created by Yury on 04/08/2023.
//

import UIKit

class TableViewController: UITableViewController {
    
    // MARK: - Properties
    private var toDoList = ToDoList.getToDoList()
    
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        self.clearsSelectionOnViewWillAppear = false

        //self.navigationItem.leftBarButtonItem = self.editButtonItem // Edit mode
        navigationController?.navigationBar.prefersLargeTitles = true // Large title
        
    }
    

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell

        // Configure content
        cell.taskLabel.text = toDoList[indexPath.row].taskName
        
        return cell
    }
    
    // Deselect a cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
        let isTrue = toDoList[indexPath.row].isDone
        switch isTrue {
        case false:
            toDoList[indexPath.row].taskName = "sdfsddgsdgsdg"
            tableView.reloadRows(at: [indexPath], with: .none)
            toDoList[indexPath.row].isDone = true
        case true:
            toDoList[indexPath.row].taskName = "236236236236"
            tableView.reloadRows(at: [indexPath], with: .none)
            toDoList[indexPath.row].isDone = false
        }
        
    }

    // Remive from  leading side
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let remove = remove(at: indexPath)
        return UISwipeActionsConfiguration(actions: [remove])
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: Private Methods
extension TableViewController {
    
    // Remove action for leading swipe
    private func remove(at indexPath: IndexPath) -> UIContextualAction {
        let remove = UIContextualAction(style: .destructive, title: "Remove") { _, _, completion in
            self.toDoList.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        
        remove.image = UIImage(systemName: "xmark.circle")
        remove.backgroundColor = .systemRed
        return remove
    }
    
}
