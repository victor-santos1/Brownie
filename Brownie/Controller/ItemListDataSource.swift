//
//  ItemListDataSource.swift
//  Brownie
//
//  Created by Victor on 22/09/21.
//

import UIKit

class ItemListDataSource: NSObject {
    
    var items: [Item] = ItemDataAccess().read()
    var selectedItems: [Item] = []
    
    func add(_ item: Item) {
        items.append(item)
        ItemDataAccess().save(items)
    }
}

extension ItemListDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellListItems", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.name
        return cell
    }
}

extension ItemListDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        let index = indexPath.row
        
        if cell.accessoryType == .none {
            cell.accessoryType = .checkmark
            selectedItems.append(items[index])
            
        } else if cell.accessoryType == .checkmark {
            cell.accessoryType = .none
            let item = items[indexPath.row]
            if let index = selectedItems.firstIndex(of: item) {
                selectedItems.remove(at: index)
                
            }
        }
    }
}
