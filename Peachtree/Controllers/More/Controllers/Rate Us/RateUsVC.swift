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
        vwRating.addDashedBorder(color: (Colors.color_borderLightBlack?.withAlphaComponent(0.4))!)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backTaped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
