//
//  MealListDataSource.swift
//  Brownie
//
//  Created by Victor on 23/09/21.
//

import UIKit

class MealListDataSource: NSObject {
    var index: IndexPath?
    var tableView: UITableView?
    
    var indexForLongPress: Int?
    var meals = [Meal(name: "Comida Japonesa", happiness: 5),
                 Meal(name: "Pizza", happiness: 5),
                 Meal(name: "Macarrão", happiness: 3),
                 Meal(name: "McDonald's", happiness: 5)
    ]
    
    func add(_ meal: Meal) {
        meals.append(meal)
    }
    
    
    
    func getCell(_ cell: UITableViewCell) {
        
    }
    
   
}

extension MealListDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let meal = meals[indexPath.row]
        cell.textLabel?.text = meal.name
        
        let longPress = UILongPressGestureRecognizer(target: MealListTableViewController.self, action: #selector(MealListTableViewController.showDetailMeal(_:)))
        cell.addGestureRecognizer(longPress)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            meals.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
