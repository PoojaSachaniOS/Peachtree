//
//  RestaurantsVC.swift
//  Peachtree
//
//  Created by Anand on 10/09/22.
//

import UIKit
import Kingfisher
import CoreLocation

class RestaurantsVC: CustomBaseVC {
    //  MARK: - IB-OUTLET(S)
    @IBOutlet weak var mapBackView: UIView!
    @IBOutlet weak var tblVwRestaurants: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private var barButtonMapView: UIBarButtonItem!
    private var barButtonListView: UIBarButtonItem!
    @IBOutlet weak var loaderView: LoadingView!
    
    var restaurantsVM: RestaurantsVM!
    fileprivate var offset:Int = 0
    
    
    // MARK: - View Loading -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Restaurants"
        self.setNeedsStatusBarAppearanceUpdate()
        self.restaurantsVM = RestaurantsVM()
        self.restaurantsVM.vc = self
        self.searchBar.delegate = self
        super.configureLeftBarButtonItem()
        self.configSearchBar()
        self.registerNib()
        self.configureListMapBarButtonItems()
        self.restaurantsVM.fetchRestaurants()
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
        if self.restaurantsVM.aryRestaurantsModel.count == 0 && !((self.searchBar.text ?? "").isEmpty) {
            self.tblVwRestaurants.setEmptyMessage("No search results found. Please try again with different one.")
            return 0
        }
        self.tblVwRestaurants.restore()
        return self.restaurantsVM.aryRestaurantsModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblVwRestaurants.dequeueReusableCell(withIdentifier: RestaurantsTableCell.className, for: indexPath) as! RestaurantsTableCell
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.layoutIfNeeded()
        cell.imgVwOuter.addRoundedViewCorners(width: 4, colorBorder: (Colors.color_AppOrange!).withAlphaComponent(0.1), BackgroundColor: (Colors.color_AppOrange?.withAlphaComponent(0.10))!)
        
        let data = restaurantsVM.aryRestaurantsModel[indexPath.row]
        cell.lblName.text = data.name
        cell.lblAddress.text = data.location?.display_address![0]
        
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

extension RestaurantsVC: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let bottomEdge = scrollView.contentOffset.y + scrollView.frame.height
        if bottomEdge >= scrollView.contentSize.height {    //We reached bottom
            debugPrint("********** We reached bottom **********")
            if !self.restaurantsVM.isLoadingMore {
                if self.restaurantsVM.totalItems > self.restaurantsVM.aryStoredRestaurantsModel.count {
                    self.restaurantsVM.isLoadingMore = true
                    self.restaurantsVM.fetchRestaurants()
                }
            }
        }
    }
}

extension RestaurantsVC: UISearchBarDelegate {
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
        self.restaurantsVM.aryRestaurantsModel.removeAll()
        if searchText.isEmpty {
            self.restaurantsVM.aryRestaurantsModel = self.restaurantsVM.aryStoredRestaurantsModel
            self.tblVwRestaurants.reloadData()
            return
        }
        let data = self.restaurantsVM.aryStoredRestaurantsModel.filter { ($0.name ?? "").localizedCaseInsensitiveContains(searchText)}
        self.restaurantsVM.aryRestaurantsModel = data
        self.tblVwRestaurants.reloadData()
    }
}
