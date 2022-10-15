//
//  RestaurantsVC.swift
//  Peachtree
//
//  Created by Anand on 10/09/22.
//

import UIKit

class ShoppingVC: CustomBaseVC {
    //  MARK: - IB-OUTLET(S)
    @IBOutlet weak var mapBackView: UIView!
    @IBOutlet weak var tblVwShopping: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private var barButtonMapView: UIBarButtonItem!
    private var barButtonListView: UIBarButtonItem!
    
    
    var shoppingVM: ShoppingVM!
    fileprivate var sortingState = SortListVia.reset
    
    // MARK: - View Loading -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.shoppingVM = ShoppingVM()
        self.shoppingVM.vc = self
        super.configureLeftBarButtonItem()
        self.navigationItem.title = "Shopping"
        self.registerNib()
        searchBar.layer.cornerRadius = 8
        searchBar.backgroundColor = .white
        searchBar.searchTextField.backgroundColor = .white
        self.setNeedsStatusBarAppearanceUpdate()
        self.configureListMapBarButtonItems()
        self.configSearchBar()
        self.shoppingVM.fetchRestaurants()
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
        self.tblVwShopping.register(RestaurantsTableCell.self)
    }
    
    private func configureListMapBarButtonItems(){
        barButtonListView = UIBarButtonItem(image: UIImage(named: "map_icon")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(barBtnListClicked))
        barButtonMapView = UIBarButtonItem(image: UIImage(named: "imgListVw")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(barBtnMapClicked))
        self.navigationItem.rightBarButtonItems = [self.barButtonListView]
    }
    
    private func configSearchBar() {
        self.searchBar.delegate = self
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            let atrString = NSAttributedString(string: "Search for products, brands and more",
                                               attributes: [.foregroundColor : Colors.color_AppThemeBlack!,
                                                            .font : FontHelper.defaultSatoshiRegularFontWithSize(size: 14)])
            textfield.attributedPlaceholder = atrString
        }
    }
    
    //  MARK: - BAR BUTTION ACTION(S)
    @objc private func barBtnMapClicked() {
        self.navigationItem.setRightBarButtonItems([self.barButtonListView], animated: false)
        self.mapBackView.isHidden = true
        tblVwShopping.isHidden = false
    }
    
    @objc private func barBtnListClicked() {
        self.navigationItem.setRightBarButtonItems([self.barButtonMapView], animated: false)
        print("Show Maps")
        tblVwShopping.isHidden = true
        self.mapBackView.isHidden = false
    }
    
    @IBAction func sortBytaped(_ sender: Any) {
        self.sortByOptions()
    }

    func sortByOptions() {
        let alertController = UIAlertController(title: "SORT BY", message: "Here’s to the crazy ones, the misfits, the rebels, the troublemakers...", preferredStyle: .alert)
        
        let actionByDistanceLowtoHigh = UIAlertAction(title: "Via Distance", style: .default) { (action:UIAlertAction) in
            self.sortingState = SortListVia.distance
            self.shoppingVM.aryShoppingModel = self.shoppingVM.aryShoppingModel.sorted(by: { ($0.distance ?? 0.0) < ($1.distance ?? 0.0)} )
            self.tblVwShopping.reloadData()
        }
     /*   let actionByDistanceHightoLow = UIAlertAction(title: "Via Distance (High to Low)", style: .default) { (action:UIAlertAction) in
            self.sortingState = SortListVia.distance
            self.restaurantsVM.aryRestaurantsModel = self.restaurantsVM.aryRestaurantsModel.sorted(by: { ($0.distance ?? 0.0) > ($1.distance ?? 0.0)} )
            self.tblVwRestaurants.reloadData()
        }*/
        
        let actionByAlphabetically = UIAlertAction(title: "Via Alphabetically", style: .default) { (action:UIAlertAction) in
            self.sortingState = SortListVia.alphabeticOrder
            self.shoppingVM.aryShoppingModel = self.shoppingVM.aryShoppingModel.sorted(by: { ($0.name ?? "") < ($1.name ?? "")} )
            self.tblVwShopping.reloadData()
        }
        let actionReset = UIAlertAction(title: "Reset", style: .default) { (action:UIAlertAction) in
            self.sortingState = SortListVia.reset
            self.shoppingVM.aryShoppingModel = self.shoppingVM.aryStoredShoppingModel
            self.tblVwShopping.reloadData()
        }
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction) in
            print("You've pressed cancel");
        }
        
        alertController.addAction(actionByDistanceLowtoHigh)
     //   alertController.addAction(actionByDistanceHightoLow)
        alertController.addAction(actionByAlphabetically)
        alertController.addAction(actionReset)
        alertController.addAction(actionCancel)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension ShoppingVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filterData(searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //  self.filterData(self.searchBar.text ?? "")
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("filter data")
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
    }
    
    func filterData(_ searchText:String="") {
        self.shoppingVM.aryShoppingModel.removeAll()
        if searchText.isEmpty {
            self.shoppingVM.aryShoppingModel = self.shoppingVM.aryStoredShoppingModel
            self.tblVwShopping.reloadData()
            return
        }
        let data = self.shoppingVM.aryStoredShoppingModel.filter { ($0.name ?? "").localizedCaseInsensitiveContains(searchText)}
        self.shoppingVM.aryShoppingModel = data
        self.tblVwShopping.reloadData()
    }
}

// MARK: - UITableViewDataSource & Delegate(S)
extension ShoppingVC: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.shoppingVM.aryShoppingModel.count == 0 && !((self.searchBar.text ?? "").isEmpty) {
            self.tblVwShopping.setEmptyMessage("No search results found. Please try again with different one.")
            return 0
        }
        self.tblVwShopping.restore()
        return self.shoppingVM.aryShoppingModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblVwShopping.dequeueReusableCell(withIdentifier: RestaurantsTableCell.className, for: indexPath) as! RestaurantsTableCell
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.layoutIfNeeded()
        cell.imgVwOuter.addRoundedViewCorners(width: 4, colorBorder: (Colors.color_AppOrange!).withAlphaComponent(0.1), BackgroundColor: (Colors.color_AppOrange?.withAlphaComponent(0.10))!)
        
        let data = self.shoppingVM.aryShoppingModel[indexPath.row]
        cell.lblName.text = data.name
        cell.lblAddress.text = "\((data.location?.display_address![0] ?? "")) " + "(\(String(format: "%.2f", data.distance ?? 0.0)) miles)"
      //  cell.lblAddress.text = String(data.distance ?? 0.0)
        
        if let url = data.image_url{
            cell.imgVwOuter.kf.indicatorType = .activity
            /*  cell.imgVwOuter.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil, completionHandler: { result in
             })*/
        } else {
            cell.imgVwOuter.image = #imageLiteral(resourceName: "placeholder")
        }
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension ShoppingVC: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let bottomEdge = scrollView.contentOffset.y + scrollView.frame.height
        if bottomEdge >= scrollView.contentSize.height {    //We reached bottom
            debugPrint("********** We reached bottom **********")
            if !self.shoppingVM.isLoadingMore {
                if self.shoppingVM.totalItems > self.shoppingVM.aryStoredShoppingModel.count {
                    self.shoppingVM.isLoadingMore = true
                    self.shoppingVM.fetchRestaurants()
                }
            }
        }
    }
}
