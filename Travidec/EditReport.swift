//
//  EditReport.swift
//  Travidec
//
//  Created by IOS on 12/10/21.
//

import UIKit
import FirebaseFirestore
import Firebase
import MapKit
import CoreLocation
import CoreLocationUI

class EditReport: UIViewController {
    
    
    @IBOutlet weak var er_name: UITextField!
    @IBOutlet weak var er_subject: UITextField!
    @IBOutlet weak var er_dateTime: UILabel!
    @IBOutlet weak var er_desc: UITextField!
    
    private var db = Firestore.firestore()
    
    
    @IBOutlet weak var er_btn_high: UIButton!
    @IBOutlet weak var er_btn_medium: UIButton!
    @IBOutlet weak var er_btn_low: UIButton!
    
    //location
    @IBOutlet weak var er_longitude: UILabel!
    @IBOutlet weak var er_latitude: UILabel!
    
    @IBOutlet weak var er_mapView: MKMapView!
    
    let locationmanager = CLLocationManager()
    
    var prior = ""
    var high = "High"
    var med = "Medium"
    var low = "Low"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let docRef = db.collection("reportData").document(Auth.auth().currentUser!.uid)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                DispatchQueue.main.async
                {
                    self.er_name.text = document.data()?["name"] as? String
                    self.er_dateTime.text = document.data()?["dateTime"] as? String
                    self.er_subject.text = document.data()?["subject"] as? String
                    self.er_desc.text = document.data()?["description"] as? String
                    self.er_longitude.text = document.data()?["locationLongitude"] as? String
                    self.er_latitude.text = document.data()?["locationLatitude"] as? String
                }
            } else {
                print("Document does not exist")
            }
        }

        
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
    
    
    @IBAction func er_btn_submit(_ sender: UIButton) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: locations[0].coordinate, span: span)
        er_mapView.setRegion(region, animated: true)
        er_mapView.showsUserLocation = true
        er_latitude.text = String(region.center.latitude)
        er_longitude.text = String(region.center.longitude)
        //print(region.center.latitude)
        //print(region.center.longitude)
        
    }
    
    
    @IBAction func et_btn_high_action(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            er_btn_medium.isSelected = false
            er_btn_low.isSelected = false
        } else {
            sender.isSelected = true
            er_btn_medium.isSelected = false
            er_btn_low.isSelected = false
        }
    }
    
    @IBAction func et_btn_medium_action(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            er_btn_high.isSelected = false
            er_btn_low.isSelected = false
        } else {
            sender.isSelected = true
            er_btn_high.isSelected = false
            er_btn_low.isSelected = false
        }
    }
    
    
    @IBAction func et_btn_low_action(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            er_btn_medium.isSelected = false
            er_btn_high.isSelected = false
        } else {
            sender.isSelected = true
            er_btn_medium.isSelected = false
            er_btn_high.isSelected = false
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
