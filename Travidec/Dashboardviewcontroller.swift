//
//  Dashboardviewcontroller.swift
//  Travidec
//
//  Created by Sutomo on 14/12/21.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth

class Dashboardviewcontroller: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var db = Firestore.firestore()
    @IBOutlet weak var tableView: UITableView!
    var informer_arr = [String]()
    var sub_arr = [String]()
    var pri_arr = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return informer_arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: <#T##String#>, for: indexPath) as! isiCell2
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
