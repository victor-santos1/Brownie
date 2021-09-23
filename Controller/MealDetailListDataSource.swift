//
//  MealDetailListDataSource.swift
//  Brownie
//
//  Created by Victor on 22/09/21.
//

import UIKit

class MealDetailListDataSource: NSObject {
    var items = [Item(name: "Maionese", calories: 000),
                 Item(name: "Ketchup", calories: 000),
                 Item(name: "Molho de Alho", calories: 000),
                 Item(name: "Azeite", calories: 000),
    ]
    var selectedItems: [Item] = []
    
    func add(_ item: Item) {
        items.append(item)
    }
}

extension MealDetailListDataSource: UITableViewDataSource {
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

extension MealDetailListDataSource: UITableViewDelegate {
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
