//
//  GetStartedVC.swift
//  Peachtree
//
//  Created by Anand on 31/08/22.
//

import UIKit

class GetStartedVC: CustomBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNeedsStatusBarAppearanceUpdate()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        super.hideNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        super.showNavigationBar()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
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
