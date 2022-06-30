//
//  CategoryViewController.swift
//  GlassSlipper(storyboard)
//
//  Created by 권유진 on 2022/06/30.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    var categoryArray = [Category]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
//    MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        let category = categoryArray[indexPath.row]
        
        return cell
        
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
            
            self.categoryArray.append(newCategory)
      
        }
    
    
    }
    
//    MARK: - TableView Delegate Methods
    
    
    
    

    
    

}
