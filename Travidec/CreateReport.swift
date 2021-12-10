//
//  CreateReport.swift
//  Travidec
//
//  Created by IOS on 12/10/21.
//

import UIKit

class CreateReport: UIViewController {
    
    
    @IBOutlet weak var cr_name: UITextField!
    @IBOutlet weak var cr_dateTime: UITextField!
    @IBOutlet weak var cr_subject: UITextField!
    @IBOutlet weak var cr_desc: UITextField!
    @IBOutlet weak var cr_btn_high: UIButton!
    @IBOutlet weak var cr_btn_medium: UIButton!
    @IBOutlet weak var cr_btn_low: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btn_high_action(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            cr_btn_medium.isSelected = false
            cr_btn_low.isSelected = false
        } else {
            sender.isSelected = true
            cr_btn_medium.isSelected = false
            cr_btn_low.isSelected = false
        }
        
    }
    
    @IBAction func btn_medium_action(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            cr_btn_high.isSelected = false
            cr_btn_low.isSelected = false
        } else {
            sender.isSelected = true
            cr_btn_high.isSelected = false
            cr_btn_low.isSelected = false
        }
    }
    @IBAction func btn_low_action(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            cr_btn_medium.isSelected = false
            cr_btn_high.isSelected = false
        } else {
            sender.isSelected = true
            cr_btn_medium.isSelected = false
            cr_btn_high.isSelected = false
        }
    }
    
    @IBAction func cr_btn_submit(_ sender: UIButton) {
        
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
