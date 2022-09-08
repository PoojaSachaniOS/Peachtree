//
//  GetStartedVC.swift
//  Peachtree
//
//  Created by Anand on 31/08/22.
//

import UIKit

class GetStartedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

// ----------------------------------
//  MARK: - BUTTION ACTION(S)
//
extension GetStartedVC {
    
    @IBAction func btnGetStartedTapped(_ sender: Any) {
        if let controllerTermsOfUse = StoryboardUtils.getTermsOfUseVC() as? TermsOfUseVC {
            navigationController?.pushViewController(controllerTermsOfUse, animated: true)
        }
    }
}
