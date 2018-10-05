//
//  IngredientModel.swift
//

import Foundation

class IngredientModel {
    
    var ingredientName: String
    var ingredientMeasure: String
    
    required init (ingredientName: String, ingredientMeasure: String) {
        self.ingredientName = ingredientName
        self.ingredientMeasure = ingredientMeasure
    }
}

