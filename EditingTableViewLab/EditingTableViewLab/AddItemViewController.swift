//
//  AddItemViewController.swift
//  EditingTableViewLab
//
//  Created by Tsering Lama on 11/21/19.
//  Copyright © 2019 Tsering Lama. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    
    
    @IBOutlet weak var nameItem: UITextField!
    @IBOutlet weak var priceItem: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    var grocery: Grocery?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        grocery = Grocery(name: "nil", price: "0.0")
        nameItem.delegate = self
        priceItem.delegate = self
    }
}

extension AddItemViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == nameItem {
        grocery?.name = nameItem.text ?? "Nil"
        } else if textField == priceItem {
        grocery?.price = priceItem.text ?? "0.0"
        }
        return true
    }
}
