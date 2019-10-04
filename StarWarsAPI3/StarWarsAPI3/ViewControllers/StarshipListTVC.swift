//
//  StarshipListTVC.swift
//  StarWarsAPI3
//
//  Created by Blake kvarfordt on 10/3/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import UIKit

class StarshipListTVC: UITableViewController {
    
    @IBOutlet weak var starshipSearchBar: UISearchBar!
    
    var starships: [Starship] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        starshipSearchBar.delegate = self
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return starships.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "starshipCell", for: indexPath)

        let starship = starships[indexPath.row]
        
        cell.textLabel?.text = starship.name

        return cell
    }
    

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toStarshipDetailTVC" {
            guard let index = tableView.indexPathForSelectedRow, let destination = segue.destination as? StarshipDetailTVC else { return }
            let starship = starships[index.row]
            
            destination.starship = starship
            
        }
 
    }
}

extension StarshipListTVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        StarshipController.shared.getDaStarships(with: searchText) { (starships) in
            self.starships = starships
        }
    }
}
