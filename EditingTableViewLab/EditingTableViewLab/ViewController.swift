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
    
    var datas = [Grocery]() {
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }

    @IBAction func addItem (_ segue: UIStoryboardSegue) {
        guard let vc = segue.source as? AddItemViewController, let addItem = vc.data else {
            fatalError()
        }
    }

}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Purchased"
        case 1:
            return "Not Purchased"
        default:
            return "yup"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        let item = datas[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.price.description
        return cell
    }
}

