//
//  ViewController.swift
//  GlassSlipper(storyboard)
//
//  Created by 권유진 on 2022/06/24.
//

import UIKit
import CoreData

class GlassSlipperViewController: UITableViewController {
    
    var itemArray = [Item]()
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
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
        
//        Ternary operator ==>
//        value = condition ? valueIfTrue : valueIfFalse
        
        cell.accessoryType = item.done == true ? .checkmark : .none
        
        return cell
    }
    
    
//    Mark - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        saveItems()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
//    Mark - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "추가하기", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "추가", style: .default) { (action) in
//            what will happen once the user clicks the Add Item button on UIAlert
            
           
           
            let newItem = Item(context: self.context)
            newItem.title = textField.text!
            newItem.done = false
            
            self.itemArray.append(newItem)
            
            self.saveItems()
            
      
        }
        
        alert.addTextField { (alerttextField) in
            alerttextField.placeholder = "새로운 아이템"
            textField = alerttextField
        }
        
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
//    Mark - Model Manupulation Methods
    
    func saveItems() {
        
        do {
            try context.save()
        } catch {
            print("Error saving context \(error)")
            
        }
        
        self.tableView.reloadData()
        
    }
    
//    func loadItems() {
////        if let data = try? Data(contentsOf: dataFilePath!) {
////            let decoder = PropertyListDecoder()
////            do {
////            itemArray = try decoder.decode([Item].self, from: data)
////            } catch {
////                print("Error decoding itme array, \(error)")
////            }
////        }
//    }
    
}

