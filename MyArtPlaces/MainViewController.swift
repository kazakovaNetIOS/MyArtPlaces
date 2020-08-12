//
//  ViewController.swift
//  MyArtPlaces
//
//  Created by Natalia Kazakova on 10.08.2020.
//  Copyright © 2020 Natalia Kazakova. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
//    var places = Place.getPlaces()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //    MARK - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomTableViewCell
        
//        let place = places[indexPath.row]
//
//        cell.titleLabel.text = place.title
//        cell.locationLabel.text = place.location
//        cell.typeLabel.text = place.type
//        cell.imageOfPlace.image = place.image ?? UIImage(named: place.theaterImage!)
//        cell.imageOfPlace.layer.cornerRadius = cell.imageOfPlace.frame.size.height / 2
//        cell.imageOfPlace.clipsToBounds = true
        
        return cell
    }
    
    // MARK - Navigation
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        
        guard let newPlaceVC = segue.source as? NewPlaceViewController else { return }
        
        newPlaceVC.saveNewPlace()
//        places.append(newPlaceVC.newPlace!)
        self.tableView.reloadData()
    }
}

