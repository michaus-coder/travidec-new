//
//  isiCell2.swift
//  Travidec
//
//  Created by Sutomo on 15/12/21.
//

import UIKit

class isiCell2: UITableViewCell {
    
    @IBOutlet weak var informer: UILabel!
    @IBOutlet weak var sub: UILabel!
    @IBOutlet weak var pri: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        // Do any additional setup after loading the view.
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
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
