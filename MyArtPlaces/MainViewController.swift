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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = theaterNames[indexPath.row]
        cell?.imageView?.image = UIImage(named: theaterNames[indexPath.row])
        
        return cell!
    }
}

