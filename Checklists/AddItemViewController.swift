//
//  AddItemTableViewController.swift
//  Checklists
//
//  Created by Oleg Kudimov on 2/24/19.
//  Copyright © 2019 Oleg Kudimov. All rights reserved.
//

import UIKit
protocol AddItemViewControllerDelegate: class {
    func addItemViewControllerDidCancell(_ controller: AddItemViewController)
    func addItemViewController(_ controller: AddItemViewController, didFinishAdding item: ChecklistItem)
}

class AddItemViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var textFIeld: UITextField!
    
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    weak var delegate: AddItemViewControllerDelegate?
    
    var itemToEdit: ChecklistItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    navigationItem.largeTitleDisplayMode = .never
        
        
        if let item = itemToEdit {
            title = "Edit item"
            textFIeld.text = item.text
        }
    }
    
    // MARK:- Actions
    @IBAction func cancel() {
        delegate?.addItemViewControllerDidCancell(self)
        
    }
    @IBAction func done() {
        //Read the value from the user input
        let item = ChecklistItem()
        item.text = textFIeld.text!
        
        delegate?.addItemViewController(self, didFinishAdding: item)
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
        
        doneBarButton.isEnabled = !newText.isEmpty
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        doneBarButton.isEnabled = false
        return true
    }
}
