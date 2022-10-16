//
//  RestaurantsDetailsVC.swift
//  Peachtree
//
//  Created by Anand on 10/09/22.
//

import UIKit

enum ScreenTags: Int {
    case isFromRestaurants = 101, isFromShopping, isFromOther
}

class RestaurantsDetailsVC: CustomBaseVC {
    @IBOutlet weak var stackVw: UIStackView!
    @IBOutlet weak var vwBgDirection: UIView!
    @IBOutlet weak var lblTitle: LBLSatoshiBoldBlack20!
    @IBOutlet weak var lblAddress: LBSatoshiLight16!
    
    var isFromTag:Int?
    var restaurantsDetails:RestaurantsModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.configureLeftBarButtonItem()
        self.setUpUI()
        self.addTapGesture()
        if let navTitle = self.navigationItem.title, navTitle.isEmpty {
             self.navigationItem.title = "Details"
        }
        self.setNeedsStatusBarAppearanceUpdate()
        self.configData()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func configData() {
        if isFromTag == ScreenTags.isFromRestaurants.rawValue || isFromTag == ScreenTags.isFromShopping.rawValue {
            
            if let name = restaurantsDetails?.name, !name.isEmpty {
                lblTitle.text = name
            }
            
            if let address = ((restaurantsDetails?.location?.display_address![0])), !address.isEmpty {
                lblAddress.text = address
            }
           
        }
    }
    
    func addTapGesture() {
        let tapGesOnDirection = UITapGestureRecognizer(target: self, action: #selector(self.directionTapGestureTapped(_:)))
        tapGesOnDirection.numberOfTapsRequired = 1
        vwBgDirection.addGestureRecognizer(tapGesOnDirection)
    }
    
    override func btnBackTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func directionTapGestureTapped(_ sender: Any?) {
        self.view.endEditing(true)
        self.openDirectionPopUpVC()
    }
    
    @IBAction func btnBackTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnDirectionTapped(_ sender: Any) {
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
    
    func setUpUI() {
        for view: UIView in self.stackVw.subviews {
            if view.isKind(of: UIView.self) {
                view.backgroundColor = Colors.color_AppOrange
                view.addRoundedViewCorners(width: 8, colorBorder: .clear, BackgroundColor: Colors.color_AppOrange!)
            }
        }
        
        vwBgDirection.addRoundedViewCorners(width: 10, colorBorder: Colors.color_AppThemeBlack!, BackgroundColor: .white)
    }
    func openDirectionVC() {
        if let controller = StoryboardUtils.getDirectionsVC() as? DirectionsVC {
            if let title = lblTitle.text, !title.isEmpty {
                controller.navigationItem.title = title
            }
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
}

extension RestaurantsDetailsVC: DirectionDelegates {
    func openDirectionVC(type: String) {
        openDirectionVC()
    }
}
