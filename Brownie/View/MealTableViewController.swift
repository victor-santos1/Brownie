//
//  MealListTableViewController.swift
//  Brownie
//
//  Created by Victor on 22/09/21.
//

import UIKit

class MealListTableViewController: UITableViewController {
    
    var meals = [Meal(name: "Comida Japonesa", happiness: 5),
                 Meal(name: "Pizza", happiness: 5),
                 Meal(name: "Macarrão", happiness: 3),
                 Meal(name: "McDonald's", happiness: 5)
    ]
    
    func add(_ meal: Meal) {
        meals.append(meal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addMeal" {
            if let viewController = segue.destination as? AddMealViewController {
                viewController.handler = { meal in
                    self.add(meal)
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    @objc
    func showDetailMeal(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            let viewCell = gesture.view as! UITableViewCell
            guard let indexPath = tableView?.indexPath(for: viewCell) else { return }
            let meal = meals[indexPath.row]
            Alert(viewController: self).show(title: meal.name, message: "Está adicionado na lista")
        }
    }
    // MARK: - Tableview Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let meal = meals[indexPath.row]
        cell.textLabel?.text = meal.name
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(showDetailMeal(_:)))
        cell.addGestureRecognizer(longPress)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            meals.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}



