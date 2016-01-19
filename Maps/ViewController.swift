//
//  ViewController.swift
//  Maps
//
//  Created by UVA  on 2016/01/16.
//  Copyright © 2016 Craftsmanmor. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mymapview: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    // MARK: - Location Delegate Methods

    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        
        print("location")
        locationManager.stopUpdatingLocation()
        
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: newLocation.coordinate, span: span)
        mymapview.setRegion(region, animated: true)
        locationManager.stopUpdatingLocation()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

