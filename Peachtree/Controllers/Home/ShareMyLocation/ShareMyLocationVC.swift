//
//  ShareMyLocationVC.swift
//  Peachtree
//
//  Created by Anand on 11/09/22.
//

import UIKit

class ShareMyLocationVC: CustomBaseVC {
    //  MARK: - IB-OUTLET(S)
    @IBOutlet weak var stackVw: UIStackView!
    @IBOutlet weak var vwOuterBgDropPin: UIView!
    @IBOutlet weak var vwInnerBgDropPin: UIView!
    @IBOutlet weak var vwOuterBgShare: UIView!
    @IBOutlet weak var vwInnerBgShare: UIView!
    
    // MARK: - View Loading -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
    }
    
    // MARK: - OVERRIDE METHOD(S)
    override func btnBackTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    //  MARK: - PRIVATE METHOD(S)
    private func setUpUI() {
        super.configureLeftBarButtonItem()
        self.navigationItem.title = "Share My Location"
        self.configureFavBarButtonItem()
        
        for view: UIView in self.stackVw.subviews {
            if view.isKind(of: UIView.self) {
                view.backgroundColor = Colors.color_AppOrange
                view.addRoundedViewCorners(width: 8, colorBorder: UIColor.white, BackgroundColor: UIColor.white.withAlphaComponent(0.4))
            }
        }
        stackVw.backgroundColor = Colors.color_AppOrange
        
        vwOuterBgDropPin.addRoundedViewCorners(width: vwOuterBgDropPin.frame.size.height/2, colorBorder: .clear, BackgroundColor: (Colors.color_AppOrange?.withAlphaComponent(0.28))!)
        vwInnerBgDropPin.addRoundedViewCorners(width: vwOuterBgDropPin.frame.size.height/2, colorBorder: .white, BackgroundColor: (Colors.color_AppOrange)!)
        vwOuterBgShare.addRoundedViewCorners(width: vwOuterBgDropPin.frame.size.height/2, colorBorder: .clear, BackgroundColor: (Colors.color_AppOrange?.withAlphaComponent(0.28))!)
        vwInnerBgShare.addRoundedViewCorners(width: vwInnerBgShare.frame.size.height/2, colorBorder: .white, BackgroundColor: (Colors.color_AppOrange)!)
        vwInnerBgDropPin.addRoundedViewCorners(width: vwInnerBgDropPin.frame.size.height/2, colorBorder: .white, BackgroundColor: (Colors.color_AppOrange)!)
        
    }
    
    private func configureFavBarButtonItem() {
        let leftBarbtn = UIBarButtonItem(image: UIImage.init(named: "imgFavLocation"), style: .plain, target: self, action:#selector(ShareMyLocationVC.btnFavTapped))
        leftBarbtn.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem  = leftBarbtn
    }
    
    @objc func btnFavTapped() {
    }
}
