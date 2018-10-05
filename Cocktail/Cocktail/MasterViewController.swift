//
//  MasterViewController.swift
//

import UIKit

class MasterViewController: CCTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Random Drinks " + AppHelper.getVersion(objectTarget: self)
    }
    
    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GotoDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                
                tableView.deselectRow(at: indexPath, animated: false)
                
                if let cocktail = items?[indexPath.row] as? CocktailModel{
                    let controller = segue.destination as! DetailViewController
                    controller.configureDetailViewController(cocktail: cocktail)
                }
            }
        }
    }

    // MARK: - Table View
    override func apiEndPointCall(callbackOk: @escaping (Any?) -> Void, callbackError: @escaping (String) -> Void) {
        
        CocktailAPI.sharedInstance.getCocktails(callbackOK: { (cocktails) in
            self.items = cocktails
            self.tableView.reloadData()
            callbackOk(cocktails)
        },
                                                callbackError: { (errorMessage) in
                                                    callbackError(errorMessage)
        }
        )
    }

    override func configureCell(cell: inout UITableViewCell, indexPath: IndexPath) {
        
        if let masterCell = cell as? MasterCellView {
            if let cocktail = items?[indexPath.row] as? CocktailModel{
                masterCell.configureCell(cocktail: cocktail)
            }
        }
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "GotoDetail", sender: nil)
    }
}

