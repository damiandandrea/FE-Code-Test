//
//  MasterCellView.swift
//

import Foundation
import UIKit
import SDWebImage

class MasterCellView: UITableViewCell {

    var cocktail: CocktailModel!
    
    @IBOutlet weak var boardView: UIView!
    @IBOutlet weak var drinkNameLabel: UILabel!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var drinkPictureImageView: UIImageView!
    
    func configureCell(cocktail: CocktailModel) {
        
        self.cocktail = cocktail
        
        //Setup
        boardView.roundCorner(value: CGFloat(8.0))
        drinkPictureImageView.roundCorner(value: CGFloat(8.0))
        drinkPictureImageView.setShowActivityIndicator(true)
        drinkPictureImageView.setIndicatorStyle(.gray)

        //Data
        drinkNameLabel.text = cocktail.drinkName
        drinkPictureImageView.sd_setImage(with: URL(string: cocktail.drinkPicture),
                              completed: { (image, error, cacheType, imageURL) in
        })
        
        if (cocktail.cocktailDetail.cocktailInstructions == ""){
            
            instructionsLabel.text = ""
            
            CocktailAPI.sharedInstance.getCocktailsDetail(drinkId: cocktail.drinkId,
                                                          cocktailDetail: cocktail.cocktailDetail,
                                                          callbackOK: { (drinkId, cocktailWithDetail) in
                                                            
                                                            if (drinkId == self.cocktail.drinkId) {
                                                                self.instructionsLabel.text = cocktailWithDetail.getShortInstructions()
                                                            }
            },
                                                          callbackError: { (errorMessage) in
                                                            print(errorMessage)
            }
            )
        }
        else {
            instructionsLabel.text = cocktail.cocktailDetail.getShortInstructions()
        }
        
    }

}
