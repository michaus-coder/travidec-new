//
//  Detailreportstatus.swift
//  Travidec
//
//  Created by Sutomo on 14/12/21.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth

class Detailreportstatus: UIViewController {

    private var db = Firestore.firestore()
    
    @IBOutlet weak var Tanggal: UILabel!
    @IBOutlet weak var Informername: UILabel!
    @IBOutlet weak var Subject: UILabel!
    @IBOutlet weak var Deskripsi: UILabel!
    @IBOutlet weak var Priority: UILabel!
    @IBOutlet weak var Status: UILabel!
    @IBOutlet weak var Latitude: UILabel!
    @IBOutlet weak var Longtitude: UILabel!
    
    @IBAction func Update(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let docRef = db.collection("reportData").document("sELzEN3ZbqfCfaS8r64o")
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                DispatchQueue.main.async {
                    let name = document.data()?["name"] as? String
                    let tanggal = document.data()?["dateTime"] as? String
                    let sub = document.data()?["subject"] as? String
                    let desk = document.data()?["description"] as? String
                    let prio = document.data()?["priority"] as? String
                    let stat = document.data()?["status"] as? String
                    let lat = document.data()?["locationLatitude"] as? String
                    let long = document.data()?["locationLongitude"] as? String
                    self.Informername.text = name
                    self.Tanggal.text = tanggal
                    self.Subject.text = sub
                    self.Deskripsi.text = desk
                    self.Priority.text = prio
                    self.Status.text = stat
                    self.Latitude.text = lat
                    self.Longtitude.text = long
                }
            }
        }
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
