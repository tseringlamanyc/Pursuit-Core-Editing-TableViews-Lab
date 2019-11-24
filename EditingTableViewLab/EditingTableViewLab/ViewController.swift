//
//  ViewController.swift
//  EditingTableViewLab
//
//  Created by Tsering Lama on 11/21/19.
//  Copyright © 2019 Tsering Lama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var groceries = [Grocery]() 
    
    var isEditingTable = false {
        didSet {
            tableView.isEditing = isEditingTable
            navigationItem.leftBarButtonItem?.title = isEditingTable ? "Done" : "Remove"   // true : false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        groceries = Grocery.createList()
    }

    @IBAction func addItem (_ segue: UIStoryboardSegue) {
        guard let vc = segue.source as? AddItemViewController, let addItem = vc.grocery else {
            fatalError()
        }
        groceries.insert(addItem, at: 0)
        let indexpath = IndexPath(row: 0, section: 0) // top of table view
        tableView.insertRows(at: [indexpath], with: .automatic)
    }
    
    
    @IBAction func removeItems(_ sender: UIBarButtonItem) {
        isEditingTable.toggle()
    }
}

extension ViewController: UITableViewDataSource {
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch section {
//        case 0:
//            return "Purchased"
//        case 1:
//            return "Not Purchased"
//        default:
//            return "yup"
//        }
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groceries.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        let item = groceries[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.price.description)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            groceries.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        case .insert:
            print("yup")
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemMoved = groceries[sourceIndexPath.row]
        groceries.remove(at: sourceIndexPath.row)
        groceries.insert(itemMoved, at: destinationIndexPath.row)
    }
}

