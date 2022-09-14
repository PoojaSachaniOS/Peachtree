//
//  RestaurantsVC.swift
//  Peachtree
//
//  Created by Anand on 10/09/22.
//

import UIKit

class ShoppingVC: UIViewController {
    @IBOutlet weak var tblVwRestaurants: UITableView!
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerNib()
        self.setNeedsStatusBarAppearanceUpdate()
        if !(UIDevice.current.hasNotch)  {
            headerViewHeight.constant = 80
        }
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    private func registerNib() {
        self.tblVwRestaurants.register(RestaurantsTableCell.self)
    }
    
    @IBAction func backTaped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension ShoppingVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblVwRestaurants.dequeueReusableCell(withIdentifier: RestaurantsTableCell.className, for: indexPath) as! RestaurantsTableCell
        
        cell.imgVwOuter.addRoundedViewCorners(width: 4, colorBorder: (Colors.color_AppOrange!).withAlphaComponent(0.1), BackgroundColor: (Colors.color_AppOrange?.withAlphaComponent(0.10))!)

        /*
        cell.vwBg.addRoundedViewCorners(width: 8, colorBorder: .clear, BackgroundColor: Colors.color_AppOrange!)
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
         */
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
