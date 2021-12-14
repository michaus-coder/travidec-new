//
//  Home.swift
//  Travidec
//
//  Created by IOS on 12/11/21.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth


class Home: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var db = Firestore.firestore()
    @IBOutlet weak var tableView: UITableView!
    
    var subject_arr = [String]()
    var dateTime_arr = [String]()
    var stats_arr = [String]()
    
    var list = [cellClass]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getData()
    }
    
//    extension ViewController: UITableViewDelegate {
//
//    }
//
//    extension Home: UITableViewDataSource {
//
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! isiCell
        cell.subject?.text = "Coba"
        return cell
    }
    
    
//    func getData() {
//        db.collection("reportData").getDocuments() { (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//                for document in querySnapshot!.documents {
//                    print("\(document.documentID) => \(document.data())")
//                }
//            }
//        }
//    }
    
        func getData() {
            db.collection("reportData").getDocuments() { snapshot, error in
                if error == nil {
                    if let snapshot = snapshot {
                        snapshot.documents.map { d in
                            return cellClass(
                                _subject: d["subject"] as? String ?? "",
                                _dtime: d["dateTime"] as? String ?? "",
                                _stats: d["prioriry"] as? String ?? "")
                        }
                    }
                }
                else {
                   //
                }
            }
        }
    
    func get_Data() {
        let docRef = db.collection("reportData").document(Auth.auth().currentUser!.uid)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
//                self.name.text = document.data()?["name"] as? String
//                self.email.text = Auth.auth().currentUser!.email
//                self.phone.text = document.data()?["phone"] as? String
            } else {
                print("Document does not exist")
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
