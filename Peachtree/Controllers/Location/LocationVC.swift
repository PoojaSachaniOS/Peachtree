//
//  LocationVC.swift
//  Peachtree
//
//  Created by Anand on 31/08/22.
//

import UIKit

class LocationVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNeedsStatusBarAppearanceUpdate()
        searchBar.layer.cornerRadius = 8
        self.setNeedsStatusBarAppearanceUpdate()
        searchBar.backgroundColor = .white
        searchBar.searchTextField.backgroundColor = .white
    }
    

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
