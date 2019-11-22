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
        data = Grocery(name: "Nil", price: 0.0)
        nameItem.delegate = self
        priceItem.delegate = self
    }
}
