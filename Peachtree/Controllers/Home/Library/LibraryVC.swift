//
//  LibraryVC.swift
//  Peachtree
//
//  Created by Anand on 24/09/22.
//

import UIKit

class LibraryVC: CustomBaseVC {
    // MARK: - IB-OUTLET(S)
    @IBOutlet weak var vwBgDirection: UIView!
    @IBOutlet weak var stackVwWebsite: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Library"
        super.setupLeftBarButtonItem()
        self.setUpUI()

    }
    
    func setUpUI() {
        for view: UIView in self.stackVwWebsite.subviews {
            if view.isKind(of: UIView.self) {
                view.backgroundColor = Colors.color_AppOrange
                view.addRoundedViewCorners(width: 8, colorBorder: .clear, BackgroundColor: Colors.color_AppOrange!)
            }
        }
        
        self.vwBgDirection.addRoundedViewCorners(width: 8, colorBorder: Colors.color_borderLightBlack!, BackgroundColor: UIColor.white)
    }
}

//  MARK: - BUTTION ACTION(S)
extension LibraryVC {
    @IBAction func btnOpenWebsiteTapped(_ sender: Any) {
        if let title = self.navigationItem.title {
            self.openWebViewVC("https://peachtree-city.org/", title: title)
        }
    }
    
    @IBAction func btnOpenDirectionsTapped(_ sender: Any) {
        self.openDirectionPopUpVC()
    }
    
    func openDirectionPopUpVC() {
        if let vcDirectionPopUp = StoryboardUtils.getDirectionPopUpVC() as? DirectionPopUpVC {
            vcDirectionPopUp.delegate = self
            vcDirectionPopUp.providesPresentationContextTransitionStyle = true
            vcDirectionPopUp.definesPresentationContext = true
            vcDirectionPopUp.modalPresentationStyle = UIModalPresentationStyle.overFullScreen;
            vcDirectionPopUp.view.backgroundColor = UIColor.init(white: 0.4, alpha: 0.8)
            self.present(vcDirectionPopUp, animated: true, completion: nil)
        }
    }
    
    
    func openWebViewVC(_ webUrl:String, title: String) {
        if let controller = StoryboardUtils.getWebViewVC() as? WebViewVC {
            controller.strWebUrl = webUrl
            controller.strNavTitle = title
            controller.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    
    
}

extension LibraryVC: DirectionDelegates {
    func openDirectionVC(type: String) {
        openDirectionVC()
    }
    
    func openDirectionVC() {
        if let controller = StoryboardUtils.getDirectionsVC() as? DirectionsVC {
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }

}
