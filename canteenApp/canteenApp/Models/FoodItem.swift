//
//  FoodItem.swift
//  canteenApp
//
//  Created by Thanh Nguyen Trong on 07/09/2022.
//

import Foundation

struct FoodItem: Identifiable, Codable {
    var id = UUID()
    var category:String // WarmFood, ColdFood, Drink, etc
    var name:String // Icecream, Pizza, Coke, etc
    var price:Double // 19.99
    var inStock:Bool

    enum CodingKeys:String, CodingKey{
        // ignore the id property, because we not going to pass it to Firebase
        // Firebase has its own document id
        // case id
        case category
        case name
        case price
        case inStock
    }
}

let foodCategories = [
    "Warm Food",
    "Sandwiches",
    "Toasted Sandwiches",
    "Wraps",
    "Salads",
    "Snacks",
    "Frozen Snacks",
    "Fruit",
    "Drinks",
    "Extras",
    "Tuesday Specials",
    "Wednesday Specials",
    "Thursday Specials",
    "Friday Specials"
]
