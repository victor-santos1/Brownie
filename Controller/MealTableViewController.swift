//
//  MealTableViewController.swift
//  Brownie
//
//  Created by Victor on 22/09/21.
//

import UIKit

class MealTableViewController: UITableViewController, ViewControllerDelegate {
    
    var meals = [Meal(name: "Comida Japonesa", happiness: 5),
                 Meal(name: "Pizza", happiness: 5),
                 Meal(name: "Macarrão", happiness: 3),
                 Meal(name: "McDonald's", happiness: 5)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func add(_ meal: Meal) {
        meals.append(meal)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addMeal" {
            if let viewController = segue.destination as? ViewController {
                viewController.delegate = self
            }
        }
    }
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let meal = meals[indexPath.row]
        cell.textLabel?.text = meal.name
        return cell
    }
}
