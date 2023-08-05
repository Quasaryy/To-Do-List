//
//  AddNewTaskViewController.swift
//  To-Do List
//
//  Created by Yury Lebedev on 05/08/2023.
//

import UIKit

class AddNewTaskViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var addNewTaskTF: UITextField!
    @IBOutlet weak var addNewTaskButton: UIButton!
    
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateSaveButton() // Make sure that save button is inactive during the transition
    }
    
    // MARK: - IB Action
    // Enable save button if text field are not empty and have been edited
    @IBAction func textFieldWasChanged(_ sender: UITextField) {
        updateSaveButton()
    }
    
}

// MARK:  - Private Methods
extension AddNewTaskViewController {
    
    // Enable save button if text field are not empty
    private func updateSaveButton() {
        let addNewTaskTF = addNewTaskTF.text ?? ""
        
        addNewTaskButton.isEnabled = !addNewTaskTF.isEmpty
    }
    
    // Settings for keyboard
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}
