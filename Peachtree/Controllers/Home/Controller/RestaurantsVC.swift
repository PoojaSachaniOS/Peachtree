//
//  RestaurantsVC.swift
//  Peachtree
//
//  Created by Anand on 10/09/22.
//

import UIKit

class RestaurantsVC: UIViewController {
    
    @IBOutlet weak var mapBackView: UIView!
    @IBOutlet weak var tblVwRestaurants: UITableView!
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    @IBOutlet weak var searchBar: UISearchBar!
    var rightActionMap = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerNib()
        searchBar.layer.cornerRadius = 8
        searchBar.backgroundColor = .white
        searchBar.searchTextField.backgroundColor = .white
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
    
    @IBAction func sortBytaped(_ sender: Any) {
        self.sortByOptions()
    }
    
    @IBAction func mapTaped(_ sender: Any) {
        rightActionMap = !rightActionMap
        if rightActionMap {
            self.mapBackView.isHidden = true
            tblVwRestaurants.isHidden = false
        } else {
            tblVwRestaurants.isHidden = true
            self.mapBackView.isHidden = false
        }
    }
    
    func sortByOptions() {
        let alertController = UIAlertController(title: "SORT BY", message: "Here’s to the crazy ones, the misfits, the rebels, the troublemakers...", preferredStyle: .alert)
        
        let actionByDistance = UIAlertAction(title: "Via Distance", style: .default) { (action:UIAlertAction) in
        }
        let actionByAlphabetically = UIAlertAction(title: "Via Alphabetically", style: .default) { (action:UIAlertAction) in
        }
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction) in
            print("You've pressed cancel");
        }
        alertController.addAction(actionByDistance)
        alertController.addAction(actionByAlphabetically)
        alertController.addAction(actionCancel)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension RestaurantsVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblVwRestaurants.dequeueReusableCell(withIdentifier: RestaurantsTableCell.className, for: indexPath) as! RestaurantsTableCell
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.imgVwOuter.addRoundedViewCorners(width: 4, colorBorder: (Colors.color_AppOrange!).withAlphaComponent(0.1), BackgroundColor: (Colors.color_AppOrange?.withAlphaComponent(0.10))!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.openRestaurantsDetails()
    }
    
    func openRestaurantsDetails() {
        if let controller = StoryboardUtils.getRestaurantsDetailsVC() as? RestaurantsDetailsVC {
            controller.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
}
