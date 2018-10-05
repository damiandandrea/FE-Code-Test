//
//  CocktailModel.swift
//

import Foundation
import SwiftyJSON

class CocktailModel {

    var drinkId: String
    var drinkPicture: String
    var drinkName: String
    var cocktailDetail = CocktailDetailModel(cocktailInstructions: "")

    required init (json: JSON) {

        drinkId = json["idDrink"].stringValue
        drinkPicture = json["strDrinkThumb"].stringValue
        drinkName = json["strDrink"].stringValue
    }
    
    
}

