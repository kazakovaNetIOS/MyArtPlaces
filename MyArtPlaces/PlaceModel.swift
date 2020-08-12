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
    
    let theaterNames = ["Мастерская Петра Фоменко", "Театр сатиры",
                        "Театр им. Вахтангова", "Современник",
                        "Театр им. Моссовета", "Содружество актеров Таганки",
                        "Театр им. Пушкина", "МДМ", "РАМТ", "МХТ им. Чехова",
                        "Театр мюзикла", "Русская песня",
                        "Московский театр оперетты", "МХАТ им. М. Горького",
                        "Театриум на Серпуховке"]
    
    func savePlaces() {
        
        for place in theaterNames {
            let image = UIImage(named: place)
            guard let imageData = image?.pngData() else { return }
            
            let newPlace = Place()
            
            newPlace.title = place
            newPlace.location = "Moscow"
            newPlace.type = "Theater"
            newPlace.imageData = imageData
            
            StorageManager.saveObject(newPlace)
        }
    }
}
