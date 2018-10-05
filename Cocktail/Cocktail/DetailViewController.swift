//
//  DetailViewController.swift
//

import UIKit

class DetailViewController: CCViewController {

    var cocktail: CocktailModel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var drinkPictureImageView: UIImageView!
    @IBOutlet weak var instructionsLabel: UILabel!
 
    func configureDetailViewController(cocktail: CocktailModel){
        
        self.cocktail = cocktail
        
        title = cocktail.drinkName
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Setup
        scrollView.roundCorner(value: CGFloat(8.0))
        drinkPictureImageView.roundCorner(value: CGFloat(8.0))
        drinkPictureImageView.setShowActivityIndicator(true)
        drinkPictureImageView.setIndicatorStyle(.gray)
        
        //Data
        drinkPictureImageView.sd_setImage(with: URL(string: cocktail.drinkPicture),
                                          completed: { (image, error, cacheType, imageURL) in
        })
        
        if (cocktail.cocktailDetail.cocktailInstructions == ""){
            
            instructionsLabel.text = ""
            
            CocktailAPI.sharedInstance.getCocktailsDetail(drinkId: cocktail.drinkId,
                                                          cocktailDetail: cocktail.cocktailDetail,
                                                          callbackOK: { (drinkId, cocktailWithDetail) in
                                                            
                                                            if (drinkId == self.cocktail.drinkId) {
                                                                self.instructionsLabel.text = cocktailWithDetail.getLongInstructions()
                                                            }
            },
                                                          callbackError: { (errorMessage) in
                                                            print(errorMessage)
            }
            )
        }
        else {
            instructionsLabel.text = cocktail.cocktailDetail.getLongInstructions()
        }
        
    }
}

