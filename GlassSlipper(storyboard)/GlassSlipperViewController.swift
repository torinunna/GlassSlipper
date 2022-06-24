//
//  ViewController.swift
//  GlassSlipper(storyboard)
//
//  Created by 권유진 on 2022/06/24.
//

import UIKit

class GlassSlipperViewController: UITableViewController {

    
    let itemArray = ["지갑", "애플워치", "에어팟"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
//    Mark - Tableview Datasource Methods

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

}

