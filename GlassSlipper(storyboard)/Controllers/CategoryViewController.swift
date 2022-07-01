//
//  CategoryViewController.swift
//  GlassSlipper(storyboard)
//
//  Created by 권유진 on 2022/06/30.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    var categories = [Category]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
//    MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        let category = categories[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        
        content.text = category.name
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    
    
//    MARK: - Data Manupulation Methods
    
    
    
    
    
//    MARK: - Add New Categories
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "추가하기", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "추가", style: .default) { (action) in
//            what will happen once the user clicks the Add Item button on UIAlert
           
            let newCategory = Category()
            newCategory.name = textField.text!
            
            self.categories.append(newCategory)
      
        }
        
        alert.addAction(action)
        
        alert.addTextField { (field) in
            textField = field
            textField.placeholder = "새로운 리스트"
        }

        present(alert, animated: true, completion: nil)
    
    
    }
    
//    MARK: - TableView Delegate Methods
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        
    }
    
    
    
    

    
    

}
