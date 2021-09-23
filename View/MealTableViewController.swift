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
        mealListDataSource?.tableView = tableView //check with Sanada
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
    
    @objc
    func showDetailMeal(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            let viewCell = gesture.view as! UITableViewCell
            guard let indexPath = tableView?.indexPath(for: viewCell) else { return }
            guard let meal = mealListDataSource?.meals[indexPath.row] else { return }
            let alert = UIAlertController(title: meal.name, message: "AHH", preferredStyle: .actionSheet)
            present(alert, animated: true, completion: nil)
        }
    }
}



