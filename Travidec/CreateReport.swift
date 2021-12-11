//
//  CreateReport.swift
//  Travidec
//
//  Created by IOS on 12/10/21.
//

import UIKit
import Firebase
import FirebaseFirestore

class CreateReport: UIViewController {
    
    
    @IBOutlet weak var cr_name: UITextField!
    @IBOutlet weak var cr_subject: UITextField!
    @IBOutlet weak var cr_desc: UITextField!
    @IBOutlet weak var cr_dateTime: UILabel!
    
    @IBOutlet weak var cr_btn_high: UIButton!
    @IBOutlet weak var cr_btn_medium: UIButton!
    @IBOutlet weak var cr_btn_low: UIButton!
    private var db = Firestore.firestore()
    
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
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
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
