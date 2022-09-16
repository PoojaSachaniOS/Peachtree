//
//  Favorites.swift
//  Peachtree
//
//  Created by Anand on 01/09/22.
//

import UIKit

class FavoritesVC: CustomBaseVC {
    @IBOutlet weak var tblVwFavorites: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Favorites"
        self.setNeedsStatusBarAppearanceUpdate()
        self.registerNib()
        self.tblVwFavorites.reloadData()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    private func registerNib() {
        self.tblVwFavorites.register(FavoritesTableCell.self)
    }

}

// MARK: - UITableViewDataSource & Delegate(S)
extension FavoritesVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.tableView(tableView, favoritesCellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, favoritesCellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblVwFavorites.dequeueReusableCell(withIdentifier: FavoritesTableCell.className, for: indexPath) as! FavoritesTableCell
        cell.backgroundColor = Colors.color_AppBackground
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
                
        cell.vwBg.addRoundedViewCorners(width: 6, colorBorder: (Colors.color_borderLightBlack!).withAlphaComponent(0.1), BackgroundColor: UIColor.white)
        cell.imgVwOuter.addRoundedViewCorners(width: 4, colorBorder: (Colors.color_AppOrange!).withAlphaComponent(0.1), BackgroundColor: (UIColor.white.withAlphaComponent(0.20)))

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
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
