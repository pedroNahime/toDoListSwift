//
//  SecondViewController.swift
//  To Do List
//
//  Created by Pedro Nahime on 15/05/19.
//  Copyright © 2019 Pedro Nahime. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var itemTextField: UITextField!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func add(_ sender: Any) {
        
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        var items:[String] = []
        
        if let tempItems = itemsObject as? [String]{
            if let text = itemTextField.text{
                items = tempItems
                items.append(text)
            }
        }else{
            if let text = itemTextField.text{
                items = [text]
            }
        }
        
        UserDefaults.standard.set(items, forKey: "items")
        itemTextField.text = ""
    }
    
}

