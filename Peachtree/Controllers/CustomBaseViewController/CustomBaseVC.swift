//
//  CustomBaseVC.swift
//  Permaxo
//
//  Created by Pooja Softradix on 03/02/22.
//

import UIKit
import SafariServices

class CustomBaseVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func configureNavigator(){
    }
    
    func disableLargeTitle(){
    }
    
    func hideNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func showNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func setupLeftBarButtonItem() {
        let leftBarbtn = UIBarButtonItem(image: UIImage.init(named: "back_white"), style: .plain, target: self, action:#selector(CustomBaseVC.btnLeftItemTapped))
        leftBarbtn.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem  = leftBarbtn
    }

    @objc func btnLeftItemTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

