//
//  GMSViewViewController.swift
//  TestSample
//
//  Created by vishnukanth on 12/06/16.
//  Copyright © 2016 Inteliment. All rights reserved.
//

import UIKit
import GoogleMaps

class GMSViewViewController: UIViewController,CLLocationManagerDelegate,GMSMapViewDelegate {

    var locationManager:CLLocationManager!
    var seenError : Bool = false
    var locationFixAchieved : Bool = false
    var locationStatus : NSString = "Not Started"
    var camera : GMSCameraPosition!
    var street,city,country,pincode,state : String!
    
    
    
    
    
    @IBOutlet weak var viewMap: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //For getting user's current location
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.distanceFilter = kCLDistanceFilterNone;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        locationManager.startUpdatingLocation()
        
        // Do any additional setup after loading the view.
    }

    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        locationManager.stopUpdatingLocation()
       // if (error) {
            if (seenError == false) {
                seenError = true
                print(error)
            }
        //}
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if (locationFixAchieved == false)
        {
            locationFixAchieved = true
            let locationArray = locations as NSArray
            let locationObj = locationArray.objectAtIndex(0) as! CLLocation
            let coord = locationObj.coordinate
            
            CLGeocoder().reverseGeocodeLocation(locationObj, completionHandler: {(placemarks, error) -> Void in
                print(locationObj)
                
                if error != nil {
                    print("Reverse geocoder failed with error" + error!.localizedDescription)
                    return
                }
                
                if placemarks?.count > 0 {
                    let pm = (placemarks?[0])! as CLPlacemark
                    let position = CLLocationCoordinate2DMake(coord.latitude,coord.longitude)
                    let marker = GMSMarker(position: position)
                    self.street = pm.thoroughfare
                    self.city = pm.locality
                    self.state = pm.administrativeArea
                    self.country = pm.country
                    self.pincode = pm.postalCode
                    let totalAddress = "\(self.street),\(self.city),\(self.state),\(self.country),\(self.pincode)"
                    marker.title = totalAddress
                    marker.infoWindowAnchor = CGPointMake(0.44, 0.45)
                    marker.icon = UIImage(named: "icon-red")
                    marker.map = self.viewMap
                    print(pm.locality )
                    print(pm.postalCode)
                    print(pm.administrativeArea)
                    print(pm.country)
                    print(pm.thoroughfare)
                    print(pm.subThoroughfare)
                    print(pm.subLocality)
                }
                else {
                    print("Problem with the data received from geocoder")
                }
            })
            
            //Zoom value should be more to view current location in the city
            
            camera = GMSCameraPosition.cameraWithLatitude(coord.latitude, longitude: coord.longitude, zoom: 15.0)
            viewMap.myLocationEnabled = true;
            viewMap.delegate = self
            viewMap.settings.myLocationButton = true;
            viewMap.camera = camera
            print(coord.latitude)
            print(coord.longitude)
        }
    }
    
    
    // authorization status
    func locationManager(manager: CLLocationManager,
                         didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        var shouldIAllow = false
        
        switch status {
        case CLAuthorizationStatus.Restricted:
            locationStatus = "Restricted Access to location"
        case CLAuthorizationStatus.Denied:
            locationStatus = "User denied access to location"
        case CLAuthorizationStatus.NotDetermined:
            locationStatus = "Status not determined"
        default:
            locationStatus = "Allowed to location Access"
            shouldIAllow = true
        }
        NSNotificationCenter.defaultCenter().postNotificationName("LabelHasbeenUpdated", object: nil)
        if (shouldIAllow == true) {
            NSLog("Location to Allowed")
            // Start location services
            locationManager.startUpdatingLocation()
        } else {
            NSLog("Denied access: \(locationStatus)")
        }
    }
    
    func mapView(mapView: GMSMapView!, didTapInfoWindowOfMarker marker: GMSMarker!)
    {
        marker.appearAnimation = kGMSMarkerAnimationPop
    }
    
    func mapView(mapView: GMSMapView!, didTapMarker marker: GMSMarker!) -> Bool
    {
        viewMap.selectedMarker = marker
        return true
    }
    
    func mapView(mapView: GMSMapView!, markerInfoWindow marker: GMSMarker!) -> UIView!
    {
       
        let customInfoWindow = NSBundle.mainBundle().loadNibNamed("CustomInfoWindow", owner: self, options: nil)[0] as? CustomInfoWindow
        customInfoWindow?.street.text = self.street
        customInfoWindow?.city.text = self.city
        customInfoWindow?.state.text = self.state
        customInfoWindow?.country.text = self.country;
        customInfoWindow?.pincode.text = self.pincode
        customInfoWindow?.frame = CGRectMake(customInfoWindow!.frame.minX,customInfoWindow!.frame.minY-120,customInfoWindow!.frame.width,customInfoWindow!.frame.height)
        return customInfoWindow
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController!.title = "Map View"
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
