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
    
    
    var films: [String] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    var starship: Starship? {
        didSet {
            self.loadViewIfNeeded()
            guard let starship = starship else { return }
            for film in starship.films {
                StarshipController.shared.getFilm(filmURL: film) { (movie) in
                    guard let film = movie else { return }
                    let title = film.title
                    self.films.append(title)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        guard let starship = starship else { return }
        costLabel.text = starship.cost
        speedLabel.text = starship.speed
        modelLabel.text = starship.model
        nameLabel.text = starship.name
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return films.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filmCell", for: indexPath)

        let film = films[indexPath.row]
        
        cell.textLabel?.text = film

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Star Movies"
    }
}
