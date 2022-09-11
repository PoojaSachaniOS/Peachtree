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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeUI()
        self.registerNib()
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
                        
            btnCategories.addRoundedViewCorners(width: 4, colorBorder: Colors.color_AppThemeBlack!, BackgroundColor: .white)
            btnCategories.setTitleColor(Colors.color_AppThemeBlack, for: .normal)
        } else {
            
            btnCategories.addRoundedViewCorners(width: 4, colorBorder: Colors.color_AppOrange!, BackgroundColor: Colors.color_AppOrange!)
            btnCategories.setTitleColor(.white, for: .normal)
                        
            btnAddress.addRoundedViewCorners(width: 4, colorBorder: Colors.color_AppThemeBlack!, BackgroundColor: .white)
            btnAddress.setTitleColor(Colors.color_AppThemeBlack, for: .normal)
        }
    }
    
    private func registerNib() {
        self.tblVwSearch.register(SearchCategoriesTableCell.self)
    }
    
    @IBAction func btnAddressTapped(_ sender: Any) {
        btnAddress.isSelected = true
        btnCategories.isSelected = false
        self.configureButtons()
    }
    

    @IBAction func btnCategoriesTapped(_ sender: Any) {
        btnAddress.isSelected = false
        btnCategories.isSelected = true
        self.configureButtons()
    }
}


extension SearchVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if btnAddress.isSelected {
            return self.tableView(tableView, categoriesCellForRowAt: indexPath)
        }
        return self.tableView(tableView, categoriesCellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, categoriesCellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblVwSearch.dequeueReusableCell(withIdentifier: SearchCategoriesTableCell.className, for: indexPath) as! SearchCategoriesTableCell
        
        cell.vwBgForImg.addRoundedViewCorners(width: 16, colorBorder: (Colors.color_AppOrange!).withAlphaComponent(0.1), BackgroundColor: (Colors.color_AppOrange?.withAlphaComponent(0.10))!)

        cell.vwBg.addRoundedViewCorners(width: 8, colorBorder: (Colors.color_borderLightBlack!).withAlphaComponent(0.1), BackgroundColor: UIColor.white)
        cell.backgroundColor = Colors.color_AppBackground
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 112.0
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
