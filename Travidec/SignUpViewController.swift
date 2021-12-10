//
//  SignUpViewController.swift
//  Travidec
//
//  Created by IOS on 12/10/21.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var fname: UITextField!
    
    @IBOutlet weak var lname: UITextField!
    @IBOutlet weak var email: UITextField!
    
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var birthdate: UITextField!
    @IBOutlet weak var phone: UITextField!
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
