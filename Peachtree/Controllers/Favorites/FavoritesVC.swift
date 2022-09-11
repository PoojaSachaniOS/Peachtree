//
//  Favorites.swift
//  Peachtree
//
//  Created by Anand on 01/09/22.
//

import UIKit

class FavoritesVC: UIViewController {
    @IBOutlet weak var tblVwFavorites: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

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
        
        cell.vwBg.addRoundedViewCorners(width: 8, colorBorder: (Colors.color_borderLightBlack!).withAlphaComponent(0.1), BackgroundColor: UIColor.white)
        
        return cell
    }
}
