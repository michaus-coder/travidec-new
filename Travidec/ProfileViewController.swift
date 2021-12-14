//
//  ProfileViewController.swift
//  Travidec
//
//  Created by IOS on 12/14/21.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth

class ProfileViewController: UIViewController {
    @IBOutlet weak var name : UILabel!
    @IBOutlet weak var email : UILabel!
    @IBOutlet weak var phone : UILabel!
    
    var db = Firestore.firestore()
    override func viewDidLoad() {
        super.viewDidLoad()
        let docRef = db.collection("users").document(Auth.auth().currentUser!.uid)
        let email_tmp = Auth.auth().currentUser!.email
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                DispatchQueue.main.async {
                    self.name.text = document.data()?["name"] as? String
                    self.email.text = "Test"
                    self.phone.text = document.data()?["phone"] as? String
                }
            } else {
                print("Document does not exist")
            }
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func logout(sender : Any){
        do {
            try Auth.auth().signOut()
        }
        catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initial = storyboard.instantiateInitialViewController()
        UIApplication.shared.keyWindow?.rootViewController = initial
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
