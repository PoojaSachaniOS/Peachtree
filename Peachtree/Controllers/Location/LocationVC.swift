//
//  LocationVC.swift
//  Peachtree
//
//  Created by Anand on 31/08/22.
//

import UIKit

class LocationVC: UIViewController {

    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNeedsStatusBarAppearanceUpdate()
        searchBar.layer.cornerRadius = 8
        searchBar.backgroundColor = .white
        searchBar.searchTextField.backgroundColor = .white
        if !(UIDevice.current.hasNotch)  {
            headerViewHeight.constant = 160
        }
    }
    

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
