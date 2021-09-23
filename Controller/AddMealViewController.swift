//
//  AddMealViewController.swift
//  Brownie
//
//  Created by Victor on 21/09/21.
//

import UIKit

class AddMealViewController: UIViewController {
    typealias Action = (Meal) -> Void
    
    @IBOutlet var nameFoodField: UITextField!
    @IBOutlet var happinessField: UITextField!
    @IBOutlet var AddMealButton: UIButton!
    @IBOutlet var tableView: UITableView!
    
    var handler: Action?
    private var mealListDataSource: MealDetailListDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AddMealButton.layer.cornerRadius = 8
        mealListDataSource = MealDetailListDataSource()
        tableView.dataSource = mealListDataSource
        tableView.delegate = mealListDataSource
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowAddItem" {
            if let addNewItemVC = segue.destination as? NewItemListViewController {
                addNewItemVC.handler = { item in
                    self.mealListDataSource?.add(item)
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    @IBAction func AddMealButtonPressed(_ sender: Any) {
        guard let nameMeal = nameFoodField.text else { return }
        guard let happiness = happinessField.text,
              let happinessInt = Int(happiness) else { return }
        guard let selectedItems = mealListDataSource?.selectedItems else { return }
        
        let meal = Meal(name: nameMeal, happiness: happinessInt, items: selectedItems)
        handler?(meal)
        navigationController?.popViewController(animated: true)
    }
}
