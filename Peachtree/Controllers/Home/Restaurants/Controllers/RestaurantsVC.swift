//
//  RestaurantsVC.swift
//  Peachtree
//
//  Created by Anand on 10/09/22.
//

import UIKit

class RestaurantsVC: CustomBaseVC {
    //  MARK: - IB-OUTLET(S)
    @IBOutlet weak var mapBackView: UIView!
    @IBOutlet weak var tblVwRestaurants: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private var barButtonMapView: UIBarButtonItem!
    private var barButtonListView: UIBarButtonItem!
    
    let restaurantsVM = RestaurantsVM()

    
    // MARK: - View Loading -
    override func viewDidLoad() {
        super.viewDidLoad()
        super.configureLeftBarButtonItem()
        self.navigationItem.title = "Restaurants"
        self.configSearchBar()
        self.registerNib()
        self.setNeedsStatusBarAppearanceUpdate()
        self.configureListMapBarButtonItems()
        
        self.fetchRestaurants(searchText: "Restaurants", latitude: 28.9593506, longitude: -82.0122324)
    }
    
    // MARK: - OVERRIDE METHOD(S)
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func btnBackTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    //  MARK: - PRIVATE METHOD(S)
    private func registerNib() {
        self.tblVwRestaurants.register(RestaurantsTableCell.self)
    }
    
    private func configSearchBar() {
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            let atrString = NSAttributedString(string: "Search cuisine or restaurant name",
                                               attributes: [.foregroundColor : Colors.color_AppThemeBlack!,
                                                            .font : FontHelper.defaultSatoshiRegularFontWithSize(size: 14)])
            textfield.attributedPlaceholder = atrString
            
        }
        searchBar.layer.cornerRadius = 8
        searchBar.backgroundColor = .white
        searchBar.searchTextField.backgroundColor = .white
    }
    
    private func configureListMapBarButtonItems(){
        barButtonListView = UIBarButtonItem(image: UIImage(named: "map_icon")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(barBtnListClicked))
        barButtonMapView = UIBarButtonItem(image: UIImage(named: "imgListVw")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(barBtnMapClicked))
        self.navigationItem.rightBarButtonItems = [self.barButtonListView]
    }
    
    //  MARK: - BAR BUTTION ACTION(S)
    @objc private func barBtnMapClicked() {
        self.navigationItem.setRightBarButtonItems([self.barButtonListView], animated: false)
        self.mapBackView.isHidden = true
        tblVwRestaurants.isHidden = false
    }
    
    @objc private func barBtnListClicked() {
        self.navigationItem.setRightBarButtonItems([self.barButtonMapView], animated: false)
        print("Show Maps")
        tblVwRestaurants.isHidden = true
        self.mapBackView.isHidden = false
    }
    
    @IBAction func sortBytaped(_ sender: Any) {
        self.sortByOptions()
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

// MARK: - UITableViewDataSource & Delegate(S)
extension RestaurantsVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblVwRestaurants.dequeueReusableCell(withIdentifier: RestaurantsTableCell.className, for: indexPath) as! RestaurantsTableCell
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.layoutIfNeeded()
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

extension RestaurantsVC {
    fileprivate func fetchRestaurants(searchText:String,latitude:Double,longitude:Double) {
        self.view.showLoadingIndicator()
        restaurantsVM.fetchNearByRestaurants(searchText: searchText, latitude: latitude, longitude: longitude, offset: 0) { [weak self] errMsg, success in
            guard let strongSelf = self else { return }
            strongSelf.view.hideLoadingIndicator()
            
            if success {
                print("here is success")
                self?.tblVwRestaurants.reloadData()
            }

        }
    }

}
