//
//  MapViewController.swift
//  Final
//
//  Created by Ananth Goyal on 1/15/19.
//  Copyright © 2019 Ananth Goyal. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import TomTomOnlineSDKRouting
import TomTomOnlineSDKMaps
import TomTomOnlineSDKMapsUIExtensions
import TomTomOnlineSDKSearch



class MapViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet var mapView: TTMapView!
    //var currentLocationCoords = kCLLocationCoordinate2DInvalid
    let locationManager = CLLocationManager()
    var location: CLLocation?
    var isUpdatingLocation = false
    var lastLocationError = false
    
    
    //@IBOutlet weak var MapObject: MKMapView!
 
    //var check = ShelterSelect()

    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //locationManager.requestLocation()
        
        
        /*if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }*/
        findLocation()
        initMap()
        //initLocationManager()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    func initMap(){
        self.mapView = TTMapView(frame: self.view.frame)
        self.mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        let Coords: CLLocationCoordinate2D = CLLocationCoordinate2DMake(ShelterSelect().getLatitude(), ShelterSelect().getLongitude())
        //et Home: CLLocationCoordinate2D = CLLocationCoordinate2DMake(37.76529685, -121.89968082008053)
        mapView.center(on: Coords, withZoom: 11)
        mapView.annotationManager.add(TTAnnotation(coordinate: Coords))
        self.mapView.setTilesType(.raster)
        self.view = self.mapView
        
    }
    
     func findLocation(){
        let authorizationStatus = CLLocationManager.authorizationStatus()
        if authorizationStatus == .notDetermined{
            locationManager.requestWhenInUseAuthorization()
            return;
        }
        
        if authorizationStatus == .denied || authorizationStatus == .restricted{
            reportLocationServicesDeniedError()
            return;
        }
        
    }
    
    func reportLocationServicesDeniedError(){
        let alert = UIAlertController(title: "Location Services is Disabled", message: "Please go to settings and activate it", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func initLocationManager() {
        locationManager.requestAlwaysAuthorization()
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
    


}

