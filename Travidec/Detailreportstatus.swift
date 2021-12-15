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
