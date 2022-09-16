//
//  ShareVC.swift
//  Peachtree
//
//  Created by Pooja Softradix on 10/09/22.
//

import UIKit

class ShareVC: CustomBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        super.setupLeftBarButtonItem()
        self.navigationItem.title = "Share App"
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backTaped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
