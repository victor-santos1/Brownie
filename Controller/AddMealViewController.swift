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
    @IBOutlet var buttonAdd: UIButton!
    @IBOutlet var tableView: UITableView!
    
    var handler: Action?
    private var mealListDataSource: MealDetailListDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonAdd.layer.cornerRadius = 8
        mealListDataSource = MealDetailListDataSource()
        tableView.dataSource = mealListDataSource
        tableView.delegate = mealListDataSource
    }
    
    @IBAction func buttonAddTap() {
        guard let nameMeal = nameFoodField.text else { return }
        guard let happiness = happinessField.text,
              let happinessInt = Int(happiness) else { return }
        guard let selectedItems = mealListDataSource?.selectedItems else { return }
        
        let meal = Meal(name: nameMeal, happiness: happinessInt)
        meal.items = selectedItems
        handler?(meal)
        print(selectedItems.count)
        dismiss(animated: true, completion: nil)
    }
}
