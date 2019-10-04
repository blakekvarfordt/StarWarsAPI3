//
//  StarshipDetailTVC.swift
//  StarWarsAPI3
//
//  Created by Blake kvarfordt on 10/3/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import UIKit

class StarshipDetailTVC: UITableViewController {

    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filmCell", for: indexPath)

        

        return cell
    }
}
