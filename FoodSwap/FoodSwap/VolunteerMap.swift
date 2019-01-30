//
//  VolunteerMap.swift
//  Final
//
//  Created by Ananth Goyal on 1/22/19.
//  Copyright © 2019 Ananth Goyal. All rights reserved.
//

import UIKit
import TomTomOnlineSDKMaps
import TomTomOnlineSDKRouting

class VolunteerMap: UIViewController {
    @IBOutlet var mapView: TTMapView!
    @IBOutlet weak var viewer: UIView!
    //var currentLocationCoords = kCLLocationCoordinate2DInvalid
    let locationManager = CLLocationManager()
    var location: CLLocation?
    var isUpdatingLocation = false
    var lastLocationError = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //initMap()

        // Do any additional setup after loading the view.
    }
    /*func initMap(){
        self.mapView = TTMapView(frame: self.view.frame)
        self.mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        let Coords: CLLocationCoordinate2D = CLLocationCoordinate2DMake(38, -122)
        //et Home: CLLocationCoordinate2D = CLLocationCoordinate2DMake(37.76529685, -121.89968082008053)
        mapView.center(on: Coords, withZoom: 11)
        mapView.annotationManager.add(TTAnnotation(coordinate: Coords))
        self.mapView.setTilesType(.raster)
        self.view = self.mapView*/
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

//}
