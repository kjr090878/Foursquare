//
//  FirstViewController.swift
//  NearMe
//
//  Created by Kelly Robinson on 10/5/15.
//  Copyright © 2015 Kelly Robinson. All rights reserved.
//

import UIKit
import MapKit

class FirstViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var myMapView: MKMapView!
    
         let lManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        myMapView.delegate = self
        
        // need to ask for location
        lManager.requestWhenInUseAuthorization()
        
        // show pretty blue dot
        myMapView.showsUserLocation = true
        
        lManager.delegate = self
        
//        lManager.startUpdatingLocation()

        lManager.requestLocation()
        
        
  
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        for location in locations {
            
            print(location.coordinate.latitude, location.coordinate.longitude)
            
            let annotation = MKPointAnnotation()
            
            annotation.coordinate = location.coordinate
            annotation.title = "This is Cool"
            annotation.subtitle = "And Fun!"
            
            myMapView.addAnnotation(annotation)
            
        }
        
        
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        
        print (error)
        
        
    }

    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        
        
        let annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "Pin")

        print(annotationView)
        
        //
//        annotationView.pinColor = .Purple
        annotationView.pinTintColor = UIColor.blackColor()
        
        annotationView.canShowCallout = true
        
        let button = UIButton(type: .DetailDisclosure)
        
        button.addTarget(self, action: "showDetail:", forControlEvents: .TouchUpInside)
        
        
        
        annotationView.rightCalloutAccessoryView = button
        
        return annotationView
        
    }
    
    func showDetail(button: UIButton) {
     
        if let viewController = storyboard?.instantiateViewControllerWithIdentifier("DetailVC") {
            
            viewController.view.backgroundColor = UIColor.lightGrayColor()
            
            navigationController?.pushViewController(viewController, animated: true)
            
        }
        
        
    }

    
    
}


