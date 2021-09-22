//
//  ViewController.swift
//  Brownie
//
//  Created by Victor on 21/09/21.
//

import UIKit

protocol ViewControllerDelegate {
    func add(_ meal: Meal)
}

class ViewController: UIViewController {
    
    @IBOutlet var nameFoodField: UITextField!
    @IBOutlet var happinessField: UITextField!
    @IBOutlet var buttonAdd: UIButton!
    
    var delegate: ViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonAdd.layer.cornerRadius = 8
    }
    
    @IBAction func buttonAddTap() {
        guard let nameMeal = nameFoodField.text else { return }
        guard let happiness = happinessField.text,
              let happinessInt = Int(happiness) else { return }
        
        let meal = Meal(name: nameMeal, happiness: happinessInt)
        print("Comi \(meal.name) e fiquei com felicidade: \(meal.happiness)")
        delegate?.add(meal)
        dismiss(animated: true, completion: nil)
    }
}




