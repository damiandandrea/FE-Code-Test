//
//  CCTableViewController.swift
//

import Foundation
import UIKit

class CCTableViewController: CCViewController, UITableViewDelegate, UITableViewDataSource {

    var reuseIdentifier = "Cell"
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configureCell(cell: inout UITableViewCell, indexPath: IndexPath) {
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {    
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let currentItems = items {
            return currentItems.count
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        self.configureCell(cell: &cell, indexPath: indexPath)
        
        return cell
    }
    
}
