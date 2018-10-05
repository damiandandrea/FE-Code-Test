//
//  CocktailAPI.swift
//

import Siesta
import SwiftyJSON

class CocktailAPI: Service {
    
    static let sharedInstance : CocktailAPI = {
        let instance = CocktailAPI()
        return instance
    }()
    
    init() {
        //Siesta.LogCategory.enabled = LogCategory.all
        
        super.init(baseURL: "http://www.thecocktaildb.com/api/json/v1/1")
        
        configure {
            $0.pipeline[.parsing].add(SwiftyJSONTransformer, contentTypes: ["*/json"])
        }
        
        //Master
        configureTransformer("/filter.php") {
            try (($0.content as JSON)["drinks"])
                .arrayValue
                .map{ CocktailModel(json: $0) }
        }
    }
    
    //MARK: - Browse
    func getCocktails(callbackOK: @escaping (_ data: [CocktailModel]) -> Void, callbackError: @escaping (_ errorMessage: String) -> Void) {
      
        resource("/filter.php").withParam("g", "Cocktail_glass").request(.get)
            .onSuccess { data in
                
                if let coktails = data.content as? [CocktailModel] {
                    callbackOK(coktails)
                }
                else {
                    callbackError("Error, expected element kind CocktailModel")
                }
            }
            .onFailure { error in
                callbackError(error.localizedDescription)
        }
    }
    
    func getCocktailsDetail(drinkId: String, cocktailDetail: CocktailDetailModel, callbackOK: @escaping (_ drinkId: String, _ data: CocktailDetailModel) -> Void, callbackError: @escaping (_ errorMessage: String) -> Void) {
        
        resource("/lookup.php").withParam("i", drinkId).request(.get)
            .onSuccess { data in
                
                if let dataDict = data.content as? JSON {
                    
                    let detailJson = dataDict["drinks"][0]
                    cocktailDetail.configureDetailInfo(json: detailJson)
                    
                    callbackOK(drinkId, cocktailDetail)
                }
                else{
                    callbackError("Error, expected element kind CocktailDetailModel")
                }
            }
            .onFailure { error in
                callbackError(error.localizedDescription)
        }
    }
    
}

