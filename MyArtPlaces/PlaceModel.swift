//
//  PlaceModel.swift
//  MyArtPlaces
//
//  Created by Natalia Kazakova on 11.08.2020.
//  Copyright © 2020 Natalia Kazakova. All rights reserved.
//

import UIKit

struct Place {
    
    var title: String
    var location: String?
    var type: String?
    var image: UIImage?
    var theaterImage: String?
    
    static let theaterNames = ["Мастерская Петра Фоменко", "Театр сатиры",
                        "Театр им. Вахтангова", "Современник",
                        "Театр им. Моссовета", "Содружество актеров Таганки",
                        "Театр им. Пушкина", "МДМ", "РАМТ", "МХТ им. Чехова",
                        "Театр мюзикла", "Русская песня",
                        "Московский театр оперетты", "МХАТ им. М. Горького",
                        "Театриум на Серпуховке"]
    
    static func getPlaces() -> [Place] {
        
        var places = [Place]()
        
        for place in theaterNames {
            places.append(Place(title: place, location: "Москва", type: "Театр", image: nil, theaterImage: place))
        }
        
        return places
    }
}
