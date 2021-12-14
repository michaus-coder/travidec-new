//
//  CreateReport.swift
//  Travidec
//
//  Created by IOS on 12/10/21.
//

import UIKit
import Firebase
import FirebaseFirestore
import MapKit
import CoreLocationUI
import CoreLocation

class CreateReport: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var cr_name: UITextField!
    @IBOutlet weak var cr_subject: UITextField!
    @IBOutlet weak var cr_desc: UITextField!
    @IBOutlet weak var cr_dateTime: UILabel!
    
    @IBOutlet weak var cr_btn_high: UIButton!
    @IBOutlet weak var cr_btn_medium: UIButton!
    @IBOutlet weak var cr_btn_low: UIButton!
    private var db = Firestore.firestore()
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationmanager = CLLocationManager()
    
    var prior = ""
    var high = "High"
    var med = "Medium"
    var low = "Low"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let time = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d yyyy, h:mm:ss a"
        let formattedDateInString = formatter.string(from: time)

        cr_dateTime.text = formattedDateInString
        
        locationmanager.delegate = self
        locationmanager.requestWhenInUseAuthorization()
        locationmanager.startUpdatingLocation()
        
        
        if(prior == high)
        {
            prior = "High"
        }
        else if (prior == med)
        {
            prior = "Medium"
        }
        else {
            prior = "Low"
        }
        

    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: locations[0].coordinate, span: span)
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
        print(span)
        print(region)
    }
    
    
//    private func create_btn() {
//        if #available(iOS 15.0, *) {
//            let button = CLLocationButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
//            button.label = .currentLocation
//            button.icon = .arrowOutline
//            button.center = view.center
//            view.addSubview(button)
//            button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
//        } else {
//            // Fallback on earlier versions
//        }
//    }
    
//    @IBAction func btn_location_action(_ sender: UIButton){
////        btn_location.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
//    }
//
//    @objc func didTapButton() {
//        manager.startUpdatingLocation()
//    }
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let location = locations.first else { return }
//        self.manager.stopUpdatingLocation()
//        print(locations)
//    }
    
    @IBAction func btn_high_action(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            cr_btn_medium.isSelected = false
            cr_btn_low.isSelected = false
            prior = high
        } else {
            sender.isSelected = true
            cr_btn_medium.isSelected = false
            cr_btn_low.isSelected = false
            prior = high
        }
        
    }
    
    @IBAction func btn_medium_action(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            cr_btn_high.isSelected = false
            cr_btn_low.isSelected = false
            prior = med
        } else {
            sender.isSelected = true
            cr_btn_high.isSelected = false
            cr_btn_low.isSelected = false
            prior = med
        }
    }
    
    @IBAction func btn_low_action(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            cr_btn_medium.isSelected = false
            cr_btn_high.isSelected = false
            prior = low
        } else {
            sender.isSelected = true
            cr_btn_medium.isSelected = false
            cr_btn_high.isSelected = false
            prior = low
        }
    }
    
    @IBAction func cr_btn_submit(_ sender: UIButton) {
        db.collection("reportData").document().setData([
            "name": cr_name.text!,
            "dateTime": cr_dateTime.text!,
            "subject": cr_subject.text!,
            "description": cr_desc.text!,
            "priority": prior
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
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
