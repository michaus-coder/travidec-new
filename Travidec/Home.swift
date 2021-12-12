//
//  Home.swift
//  Travidec
//
//  Created by IOS on 12/11/21.
//

import UIKit
import FirebaseFirestore



class Home: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var db = Firestore.firestore()
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
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
        cell.subject?.text = "Hello"
        return cell
    }
    
    
    func getData() {
        db.collection("reportData").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
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
