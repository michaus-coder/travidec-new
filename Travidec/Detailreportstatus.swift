//
//  Detailreportstatus.swift
//  Travidec
//
//  Created by Sutomo on 14/12/21.
//

import UIKit
import Firebase
import FirebaseFirestore

class Detailreportstatus: UIViewController {

    let db = Firestore.firestore()
    @IBOutlet weak var Informername: UILabel!
    @IBOutlet weak var Tanggal: UILabel!
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
        getData()
        // Do any additional setup after loading the view.
    }
    
    func getData() {
        let docRef = db.document("reportData/kABBnG94qJtAV0M8UrDA")
        docRef.getDocument { snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            
            guard let tanggal = data["dateTime"] as? String else {
                return
            }
            guard let desk = data["description"] as? String else {
                return
            }
            guard let prio = data["priority"] as? String else {
                return
            }
            guard let nama = data["name"] as? String else{
                return
            }
            guard let sub = data["subject"] as? String else {
                return
            }
            guard let lat = data["locationLatitude"] as? String else {
                return
            }
            guard let long = data["locationLongtitude"] as? String else {
                return
            }
            
            self.Informername.text = nama
            self.Tanggal.text = tanggal
            self.Deskripsi.text = desk
            self.Priority.text = prio
            self.Subject.text = sub
            self.Latitude.text = lat
            self.Longtitude.text = long
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
