//
//  CocktailDetailModel.swift
//

import Foundation
import SwiftyJSON

class CocktailDetailModel {
    
    var cocktailInstructions: String
    var ingredients = [IngredientModel]()
    
    required init (cocktailInstructions: String) {
        self.cocktailInstructions = cocktailInstructions
    }
    
    func configureDetailInfo(json: JSON){
        cocktailInstructions = json["strInstructions"].stringValue
        
        for i in 1...15 {
            print(json["strIngredient\(i)"].stringValue)
            print(json["strMeasure\(i)"].stringValue)
            
            if (json["strIngredient\(i)"].stringValue != "") {
            
                ingredients.append(IngredientModel(ingredientName: json["strIngredient\(i)"].stringValue, ingredientMeasure: json["strMeasure\(i)"].stringValue))
            }
        }
    }
    
    func getLongInstructions() -> String {
        
        var description = ""
        
        for ingredient in ingredients {
            description = "\(description)\n \(ingredient.ingredientMeasure) - \(ingredient.ingredientName)"
        }
        
        description = "\(description) \n\n• How to prepare \n\n \(cocktailInstructions)"
        
        return description
    }
    
    func getShortInstructions() -> String {
        
        var description = ""
        
        if (ingredients.count > 2) {
            
            for i in 0...1 {
                description = "\(description)\n• \(ingredients[i].ingredientName)"
            }
        
            description = "\(description)\nand \(ingredients.count-2) more ingredients."
        }
        else {
            for ingredient in ingredients {
                description = "\(description)\n• \(ingredient.ingredientName)"
            }
        }
        
        return description
    }
}
