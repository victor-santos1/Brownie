//
//  ItemListViewController.swift
//  Brownie
//
//  Created by Victor on 23/09/21.
//

import UIKit

class ItemListViewController: UIViewController {
    typealias Action = (Item) -> Void
    
    @IBOutlet var nameItemField: UITextField!
    @IBOutlet var caloriesItemField: UITextField!
    @IBOutlet var buttonAddItem: UIButton!
    
    var handler: Action?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonAddItem.layer.cornerRadius = 8
    }

    @IBAction func addItemButtonPressed(_ sender: Any) {
        guard let nameItem = nameItemField.text else { return }
        guard let calories = caloriesItemField.text,
              let caloriesDoble = Double(calories) else { return }
        let item = Item(name: nameItem, calories: caloriesDoble)
        handler?(item)
        dismiss(animated: true, completion: nil)
    }
}
