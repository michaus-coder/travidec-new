//
//  EditReport.swift
//  Travidec
//
//  Created by IOS on 12/10/21.
//

import UIKit

class EditReport: UIViewController {
    
    
    
    @IBOutlet weak var er_name: UITextField!
    @IBOutlet weak var er_dateTime: UITextField!
    @IBOutlet weak var er_subject: UITextField!
    @IBOutlet weak var er_description: UITextField!
    
    @IBOutlet weak var er_btn_high: UIButton!
    @IBOutlet weak var er_btn_medium: UIButton!
    @IBOutlet weak var er_btn_low: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
