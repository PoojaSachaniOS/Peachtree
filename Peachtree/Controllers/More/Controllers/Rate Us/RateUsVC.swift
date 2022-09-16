//
//  RateUsVC.swift
//  Peachtree
//
//  Created by Pooja Softradix on 10/09/22.
//

import UIKit

class RateUsVC: CustomBaseVC {

    @IBOutlet weak var vwRating: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        super.setupLeftBarButtonItem()
        self.navigationItem.title = "Rate Us"
        DispatchQueue.main.async {
            self.vwRating.addDashedBorder(color: (Colors.color_LightGrey)!)
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backTaped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
