//
//  MapViewController.swift
//  MyArtPlaces
//
//  Created by Natalia Kazakova on 01.09.2020.
//  Copyright © 2020 Natalia Kazakova. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    var place: Place!
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupPlacemark()
    }
    
    // MARK: - Private
    
    private func setupPlacemark() {
        
        guard let location = place.location else { return }
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(location) { (placemarks, error) in
            
            if let error = error {
                print(error)
                return
            }
            
            guard let placemarks = placemarks else { return }
            
            let placemark = placemarks.first
            
            let annotation = MKPointAnnotation()
            annotation.title = self.place.title
            annotation.subtitle = self.place.type
            
            guard let placemarkLocation = placemark?.location else { return }
            
            annotation.coordinate = placemarkLocation.coordinate
            
            self.mapView.showAnnotations([annotation], animated: true)
            self.mapView.selectAnnotation(annotation, animated: true)
        }
        
    }
    
    
    // MARK: - IBAction
    
    @IBAction func closeVC() {
        dismiss(animated: true)
    }
}
