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
    let annotationIdentifier = "annotationIdentifier"
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        
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

// MARK: - MKMapViewDelegate

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard !(annotation is MKUserLocation) else { return nil }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView?.canShowCallout = true
        }
        
        guard let imageData = place.imageData else { return nil }
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.image = UIImage(data: imageData)
        annotationView?.rightCalloutAccessoryView = imageView
        
        return annotationView
    }
}
