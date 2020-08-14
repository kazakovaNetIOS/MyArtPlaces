//
//  PlaceModel.swift
//  MyArtPlaces
//
//  Created by Natalia Kazakova on 11.08.2020.
//  Copyright © 2020 Natalia Kazakova. All rights reserved.
//

import RealmSwift

class Place: Object {
    
    @objc dynamic var title = ""
    @objc dynamic var location: String?
    @objc dynamic var type: String?
    @objc dynamic var imageData: Data?
    @objc dynamic var date = Date()
    
    convenience init(title: String, location: String?, type: String?, imageData: Data?) {
        self.init()
        
        self.title = title
        self.location = location
        self.type = type
        self.imageData = imageData
    }
}
