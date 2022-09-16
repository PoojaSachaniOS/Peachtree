//
//  RateUsVC.swift
//  Peachtree
//
//  Created by Pooja Softradix on 10/09/22.
//

import UIKit

class RateUsVC: CustomBaseVC {
    //  MARK: - IB-OUTLET(S)
    @IBOutlet weak var vwRating: UIView!
    
    // MARK: - View Loading -
    override func viewDidLoad() {
        super.viewDidLoad()
        super.setupLeftBarButtonItem()
        self.navigationItem.title = "Rate Us"
        DispatchQueue.main.async {
            self.vwRating.addDashedBorder(color: (Colors.color_LightGrey)!)
        }
    }
}
