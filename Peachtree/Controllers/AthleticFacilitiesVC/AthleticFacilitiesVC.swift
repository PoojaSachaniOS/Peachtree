//
//  AthleticFacilitiesVC.swift
//  Peachtree
//
//  Created by Anand on 29/09/22.
//

import UIKit

class AthleticFacilitiesVC: CustomBaseVC {
    //  MARK: - IB-OUTLET(S)
    @IBOutlet weak var tblVwAthlectic: UITableView!
    
    var aryList = ["Pools", "Community/Neighborhood parks", "Tennis center", "Senior Center", "BMX bike track", "Nature Areas", "Skate Park", "Peachtree City Athletic Complex (The PAC)", "The Frederick Brown Jr. Amphitheater", "Splash Pad", "Gymnasium"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerNib()
        super.configureLeftBarButtonItem()
        self.view.backgroundColor = Colors.color_AppBackground
        self.tblVwAthlectic.backgroundColor = Colors.color_AppBackground
    }
    
    private func registerNib() {
        self.tblVwAthlectic.register(SearchCategoriesTableCell.self)
    }
    
    override func btnBackTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - UITableViewDataSource & Delegate(S)
extension AthleticFacilitiesVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return self.tableView(tableView, categoriesCellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, categoriesCellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblVwAthlectic.dequeueReusableCell(withIdentifier: SearchCategoriesTableCell.className, for: indexPath) as! SearchCategoriesTableCell
        cell.vwBgForImg.addRoundedViewCorners(width: 16, colorBorder: (Colors.color_AppOrange!).withAlphaComponent(0.1), BackgroundColor: (Colors.color_AppOrange?.withAlphaComponent(0.10))!)
        
        cell.vwBg.addRoundedViewCorners(width: 8, colorBorder: (Colors.color_borderLightBlack!).withAlphaComponent(0.1), BackgroundColor: UIColor.white)
        cell.backgroundColor = Colors.color_AppBackground
        cell.backgroundColor = Colors.color_AppBackground
        cell.contentView.backgroundColor = Colors.color_AppBackground
        cell.selectionStyle = .none
        cell.layoutIfNeeded()
        let model = aryList[indexPath.row]
        cell.lblCategoriesName.text = model
        cell.imgVwCategories.isHidden = false
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = aryList[indexPath.row]
        self.openCategoriesVC(title: model)
        
    }
    
    func openCategoriesVC(title: String) {
        if let controller = StoryboardUtils.getCategoriesVC() as? CategoriesVC {
            controller.hidesBottomBarWhenPushed = true
            controller.navigationItem.title = title
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
}
