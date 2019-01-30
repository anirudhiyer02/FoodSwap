//
//  ShelterSelect.swift
//  Final
//
//  Created by Ananth Goyal on 1/16/19.
//  Copyright © 2019 Ananth Goyal. All rights reserved.
//

import UIKit


var latitude: Double = 0
var longitude: Double = 0



class ShelterSelect: UIViewController {
    
   
    //Shelter Buttons
    
    @IBAction func brooksideShelter(_ sender: UIButton) {
        latitude = 37.8921829
        longitude = -122.05684439999999
    }
    
    
    @IBAction func rescueMission(_ sender: UIButton) {
        latitude = 37.9353808
        longitude = -122.36747230000003
    }
    
    @IBAction func calliHouse(_ sender: UIButton) {
        latitude = 37.9653633
        longitude = -122.35796240000002
    }

   
    
    
    
    
    
    
    public func getLatitude() -> Double{
        return latitude
    }
    
    public func getLongitude() -> Double{
        return longitude
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
