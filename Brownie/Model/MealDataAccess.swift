//
//  MealDataAccess.swift
//  Brownie
//
//  Created by Victor on 24/09/21.
//

import Foundation

class MealDataAccess {
    static let documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("meals")

    func save(_ meals: [Meal]) {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: meals, requiringSecureCoding: false)
            try data.write(to: Self.archiveURL)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func read() -> [Meal] {
        do {
            let data = try Data(contentsOf: Self.archiveURL)
            guard let savedMeals = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Meal] else { return [] }
            return savedMeals
        } catch  {
            print(error.localizedDescription)
            return []
        }
    }
    
}
