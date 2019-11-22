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
    
    var data: Grocery?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = Grocery(name: "nil", price: "0.0", state: .notpurchased)
        nameItem.delegate = self
        priceItem.delegate = self
    }
}

extension AddItemViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == nameItem {
        data?.name = nameItem.text ?? "Nil"
        } else if textField == priceItem {
        data?.price = priceItem.text ?? "0.0"
        }
        return true
    }
}
