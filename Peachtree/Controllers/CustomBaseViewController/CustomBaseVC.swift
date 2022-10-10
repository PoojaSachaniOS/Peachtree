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
        if (UIDevice.current.userInterfaceIdiom == .pad) {
            self.navigationController?.additionalSafeAreaInsets.top = 20
        }
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
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
    
    func configureLeftBarButtonItem() {
        let leftBarbtn = UIBarButtonItem(image: UIImage.init(named: "back_white"), style: .plain, target: self, action:#selector(CustomBaseVC.btnBackTapped))
        leftBarbtn.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem  = leftBarbtn
    }

    @objc func btnBackTapped() {
    }
    
    
    func alertMessage(message:String,buttonText:String,completionHandler:(()->())?) {
        let alert = UIAlertController(title: "Location", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonText, style: .default) { (action:UIAlertAction) in
            completionHandler?()
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

