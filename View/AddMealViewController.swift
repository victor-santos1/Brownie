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
    private var itemListDataSource: ItemListDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AddMealButton.layer.cornerRadius = 8
        itemListDataSource = ItemListDataSource()
        //The protocols of datasource and delegate are in only one class
        tableView.dataSource = itemListDataSource
        tableView.delegate = itemListDataSource
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowAddItem" {
            if let addNewItemVC = segue.destination as? ItemListViewController {
                addNewItemVC.handler = { item in
                    self.itemListDataSource?.add(item)
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    @IBAction func AddMealButtonPressed(_ sender: Any) {
        guard let nameMeal = nameFoodField.text else { return }
        guard let happiness = happinessField.text,
              let happinessInt = Int(happiness) else { return }
        guard let selectedItems = itemListDataSource?.selectedItems else { return }
        let meal = Meal(name: nameMeal, happiness: happinessInt, items: selectedItems)
        handler?(meal)
        navigationController?.popViewController(animated: true)
    }
}
