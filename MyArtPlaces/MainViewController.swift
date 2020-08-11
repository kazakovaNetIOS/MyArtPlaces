//
//  ViewController.swift
//  MyArtPlaces
//
//  Created by Natalia Kazakova on 10.08.2020.
//  Copyright © 2020 Natalia Kazakova. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let theaterNames = ["Мастерская Петра Фоменко", "Театр сатиры",
                        "Театр им. Вахтангова", "Современник",
                        "Театр им. Моссовета", "Содружество актеров Таганки",
                        "Театр им. Пушкина", "МДМ", "РАМТ", "МХТ им. Чехова",
                        "Театр мюзикла", "Русская песня",
                        "Московский театр оперетты", "МХАТ им. М. Горького",
                        "Театриум на Серпуховке"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //    MARK - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theaterNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomTableViewCell
        
        cell.titleLabel.text = theaterNames[indexPath.row]
        cell.imageOfPlace.image = UIImage(named: theaterNames[indexPath.row])
        cell.imageOfPlace.layer.cornerRadius = cell.imageOfPlace.frame.size.height / 2
        cell.imageOfPlace.clipsToBounds = true
        
        return cell
    }
    
    //    MARK - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
}

