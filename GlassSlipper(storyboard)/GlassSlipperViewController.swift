//
//  ViewController.swift
//  GlassSlipper(storyboard)
//
//  Created by 권유진 on 2022/06/24.
//

import UIKit

class GlassSlipperViewController: UITableViewController {

    
    var itemArray = ["지갑", "애플워치", "에어팟"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
//    Mark - TableView Datasource Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GlassSlipperCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        content.text = itemArray[indexPath.row]
        
        cell.contentConfiguration = content
        
        return cell
    }
    
//    Mark - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
//    Mark - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "추가하기", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "추가", style: .default) { (action) in
//            what will happen once the user clicks the Add Item button on UIAlert
            
            self.itemArray.append(textField.text!)
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alerttextField) in
            alerttextField.placeholder = "새로운 아이템"
            textField = alerttextField
        }
        
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
}

