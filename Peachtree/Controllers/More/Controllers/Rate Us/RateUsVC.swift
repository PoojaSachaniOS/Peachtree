//
//  RateUsVC.swift
//  Peachtree
//
//  Created by Pooja Softradix on 10/09/22.
//

import UIKit

class RateUsVC: UIViewController {

    @IBOutlet weak var vwRating: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.vwRating.addDashedBorder(color: (Colors.color_LightGrey)!)
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backTaped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
