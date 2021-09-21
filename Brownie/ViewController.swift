//
//  ViewController.swift
//  Brownie
//
//  Created by Victor on 21/09/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nameFoodField: UITextField!
    @IBOutlet var happinessField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonAddTap() {
        guard let nameFood = nameFoodField.text else { return }
        guard let happiness = happinessField.text else { return }
        
        print("Comi \(nameFood) e fiquei com felicidade: \(happiness)")
    }
}

