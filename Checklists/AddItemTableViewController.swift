//
//  AddItemTableViewController.swift
//  Checklists
//
//  Created by Oleg Kudimov on 2/24/19.
//  Copyright © 2019 Oleg Kudimov. All rights reserved.
//

import UIKit

class AddItemTableViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var textFIeld: UITextField!
    
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    navigationItem.largeTitleDisplayMode = .never
    }
    
    // MARK:- Actions
    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func done() {
        //Read the value from the user input
        print("Contents of the text field: \(textFIeld.text!)")
        
        
        navigationController?.popViewController(animated: true)
    }
    
    // MARK:- Auto opened keyboard
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textFIeld.becomeFirstResponder()
        
    }
    
    // MARK:- Table View Delegates
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil 
    }
    // MARK:- Text Field Delegates
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool
    {
        let oldText = textFIeld.text!
        let stringRange = Range(range, in: oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        
        if newText.isEmpty {
            doneBarButton.isEnabled = false
        } else {
            doneBarButton.isEnabled = true
        }
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        doneBarButton.isEnabled = false
        return true
    }
}
