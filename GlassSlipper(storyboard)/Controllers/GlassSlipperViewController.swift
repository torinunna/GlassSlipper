//
//  ViewController.swift
//  GlassSlipper(storyboard)
//
//  Created by 권유진 on 2022/06/24.
//

import UIKit

class GlassSlipperViewController: UITableViewController {

    
    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "지갑"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "에어팟"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "애플워치"
        itemArray.append(newItem3)
        
//        if let items = defaults.array(forKey: "GlassSlipperArray") as? [String] {
//            itemArray = items
//        }
        
    }
    
    
//    Mark - TableView Datasource Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GlassSlipperCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        
        content.text = item.title
        
        cell.contentConfiguration = content
        
        
        
        if item.done == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    
//    Mark - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
//    Mark - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "추가하기", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "추가", style: .default) { (action) in
//            what will happen once the user clicks the Add Item button on UIAlert
           
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "GlassSlipperArray")
            
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

