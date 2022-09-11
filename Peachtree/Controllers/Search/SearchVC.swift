//
//  SearchVC.swift
//  Peachtree
//
//  Created by Anand on 01/09/22.
//

import UIKit

class SearchVC: UIViewController {
    @IBOutlet weak var btnCategories: ButtonSearchCategories!
    @IBOutlet weak var btnAddress: ButtonSearchCategories!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeUI()
    }
    
    func initializeUI() {
        btnAddress.isEnabled = true
        btnCategories.isEnabled = false
    }
    
    @IBAction func btnAddressTapped(_ sender: Any) {
        self.btnCategories.isEnabled = false
        self.btnAddress.isEnabled = true
    }
    

    @IBAction func btnCategoriesTapped(_ sender: Any) {
        self.btnCategories.isEnabled = true
        self.btnAddress.isEnabled = false
    }
}
