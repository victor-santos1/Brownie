//
//  MealListTableViewController.swift
//  Brownie
//
//  Created by Victor on 22/09/21.
//

import UIKit

class MealListTableViewController: UITableViewController {
    
    var mealListDataSource: MealListDataSource?
    override func viewDidLoad() {
        super.viewDidLoad()
        mealListDataSource = MealListDataSource()
        tableView.dataSource = mealListDataSource
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addMeal" {
            if let viewController = segue.destination as? AddMealViewController {
                viewController.handler = { meal in
                    self.mealListDataSource?.add(meal)
                    self.tableView.reloadData()
                }
            }
        }
    }
}
