//
//  NewPlaceViewController.swift
//  MyArtPlaces
//
//  Created by Natalia Kazakova on 11.08.2020.
//  Copyright © 2020 Natalia Kazakova. All rights reserved.
//

import UIKit

class NewPlaceViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
    }
}

// MARK - TableView delegate

extension NewPlaceViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
        } else {
            view.endEditing(true)
        }
    }
}

// MARK - Text field delegate

extension NewPlaceViewController: UITextFieldDelegate {
    
    // Hide the keyboard by clicking on Done
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
