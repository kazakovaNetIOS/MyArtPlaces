//
//  StorageManager.swift
//  MyArtPlaces
//
//  Created by Natalia Kazakova on 13.08.2020.
//  Copyright © 2020 Natalia Kazakova. All rights reserved.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func saveObject(_ place: Place) {
        
        try! realm.write {
            realm.add(place)
        }
    }
    
    static func deleteObject(_ place: Place) {
        
        try! realm.write {
            realm.delete(place)
        }
    }
}
