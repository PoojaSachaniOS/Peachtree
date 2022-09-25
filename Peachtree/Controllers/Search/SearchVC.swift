//
//  SearchVC.swift
//  Peachtree
//
//  Created by Anand on 01/09/22.
//

import UIKit

class SearchVC: UIViewController {
    @IBOutlet weak var stackVw: UIStackView!
    @IBOutlet weak var btnCategories: UIButton!
    @IBOutlet weak var btnAddress: UIButton!
    @IBOutlet weak var tblVwSearch: UITableView!
    private var btnTemp: UIButton!

    var aryList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNeedsStatusBarAppearanceUpdate()
        self.configureTempBarButtonItem()
        self.initializeUI()
        self.registerNib()
        self.navigationItem.title = "Search"
        aryList = ["Atm", "Bakery", "Bank","Atm", "Bakery", "Bank"]
       
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func configureTempBarButtonItem() {
        btnTemp = UIButton(type: .custom)
        btnTemp.titleLabel?.numberOfLines = 0
        btnTemp.titleLabel?.font = FontHelper.californianBoldFontWithSize(size: 17)
        btnTemp.frame = CGRect()
        btnTemp.frame.size.width = 100
        btnTemp.frame.size.height = 50
        self.btnTemp.setTitle(String(format: "%i\u{00B0} F\n%@",80,"Clear"), for: .normal)

        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: btnTemp)
    }
    
    func initializeUI() {
        for view: UIView in self.stackVw.subviews {
            if (view is UIButton) {
                let btn: UIButton? = (view as? UIButton)
                btn?.titleLabel?.font = FontHelper.defaultSatoshiBoldFontWithSize(size: 16)
            }
        }
        
        self.tblVwSearch.backgroundColor = Colors.color_AppBackground
        self.view.backgroundColor = Colors.color_AppBackground
        btnAddress.isSelected = true
        btnCategories.isSelected = false
        self.configureButtons()
    }
    
    func configureButtons() {
        btnAddress?.titleLabel?.font = FontHelper.defaultSatoshiBoldFontWithSize(size: 16)
        btnCategories?.titleLabel?.font = FontHelper.defaultSatoshiBoldFontWithSize(size: 16)

        if btnAddress.isSelected {
            btnAddress.addRoundedViewCorners(width: 4, colorBorder: Colors.color_AppOrange!, BackgroundColor: Colors.color_AppOrange!)
            btnAddress.setTitleColor(.white, for: .normal)
                        
            btnCategories.addRoundedViewCorners(width: 4, colorBorder: Colors.color_AppThemeBlack!.withAlphaComponent(0.4), BackgroundColor: .white)
            btnCategories.setTitleColor(Colors.color_AppThemeBlack, for: .normal)
        } else {
            
            btnCategories.addRoundedViewCorners(width: 4, colorBorder: Colors.color_AppOrange!, BackgroundColor: Colors.color_AppOrange!)
            btnCategories.setTitleColor(.white, for: .normal)
                        
            btnAddress.addRoundedViewCorners(width: 4, colorBorder: Colors.color_AppThemeBlack!.withAlphaComponent(0.4), BackgroundColor: .white)
            btnAddress.setTitleColor(Colors.color_AppThemeBlack, for: .normal)
        }
    }
    
    private func registerNib() {
        self.tblVwSearch.register(SearchCategoriesTableCell.self)
        self.tblVwSearch.register(RecentSearchTableCell.self)
    }
    
    @IBAction func btnAddressTapped(_ sender: Any) {
        btnAddress.isSelected = true
        btnCategories.isSelected = false
        self.configureButtons()
        self.tblVwSearch.reloadData()
    }
    

    @IBAction func btnCategoriesTapped(_ sender: Any) {
        btnAddress.isSelected = false
        btnCategories.isSelected = true
        self.configureButtons()
        self.tblVwSearch.reloadData()
    }
}

// MARK: - UITableViewDataSource & Delegate(S)
extension SearchVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if btnAddress.isSelected {
            return self.tableView(tableView, recentSearchCellForRowAt: indexPath)
        }
        return self.tableView(tableView, categoriesCellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, recentSearchCellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblVwSearch.dequeueReusableCell(withIdentifier: RecentSearchTableCell.className, for: indexPath) as! RecentSearchTableCell
        
        cell.vwBgForImg.addRoundedViewCorners(width: 4, colorBorder: (Colors.color_AppOrange!).withAlphaComponent(0.1), BackgroundColor: (Colors.color_AppOrange?.withAlphaComponent(0.10))!)

        cell.vwBg.addRoundedViewCorners(width: 8, colorBorder: (Colors.color_borderLightBlack!).withAlphaComponent(0.1), BackgroundColor: UIColor.white)
        cell.backgroundColor = Colors.color_AppBackground
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.layoutIfNeeded()
        let model = aryList[indexPath.row]
        cell.lblRecentSearch.text = "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used."
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, categoriesCellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblVwSearch.dequeueReusableCell(withIdentifier: SearchCategoriesTableCell.className, for: indexPath) as! SearchCategoriesTableCell
        cell.vwBgForImg.addRoundedViewCorners(width: 16, colorBorder: (Colors.color_AppOrange!).withAlphaComponent(0.1), BackgroundColor: (Colors.color_AppOrange?.withAlphaComponent(0.10))!)

        cell.vwBg.addRoundedViewCorners(width: 8, colorBorder: (Colors.color_borderLightBlack!).withAlphaComponent(0.1), BackgroundColor: UIColor.white)
        cell.backgroundColor = Colors.color_AppBackground
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.layoutIfNeeded()
        let model = aryList[indexPath.row]
        cell.lblCategoriesName.text = model
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if btnAddress.isSelected {
//            return 80.0
//        }
//        return 100.0
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
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
