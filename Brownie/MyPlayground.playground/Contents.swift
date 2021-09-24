import UIKit


let arrayKcal = [50.5, 100, 500]

func totalKcal(totalKcal: [Double]) -> Double {
    var total = 0.0
    
    for kcal in totalKcal {
         total += kcal
    }
    return total
}

let total = totalKcal(totalKcal: arrayKcal)
print(total)
