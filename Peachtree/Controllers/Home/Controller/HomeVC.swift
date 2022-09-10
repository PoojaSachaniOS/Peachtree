//
//  HomeVC.swift
//  Peachtree
//
//  Created by Anand on 31/08/22.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak var collectionVwHome: UICollectionView!
    var arr: [HomeVCTableItem<AccountVCTableItemType>] = []

    enum AccountVCTableItemType {
        case shareMyLocation, renewGolfCart, cityHall, publicSafety, reportAnIssue, library, restaurants, shopping, calendar, notifyMe, pools, recreationAndSpecialEvent, golfCartHelp, call911, onlinePayment, settings
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerNib()
        self.initializeData()
    }
    
    private func registerNib() {
        collectionVwHome.register(UINib(nibName: "HomeCollectionVWCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionVWCell")
    }
    
    private func initializeData() {
        arr.append(HomeVCTableItem(iconName: "imgShareMyLocation", title:"Share My Location", type: .shareMyLocation, showArrow: true))
        arr.append(HomeVCTableItem(iconName: "imgOnlinePayments", title:"Settins", type: .settings, showArrow: true))
        arr.append(HomeVCTableItem(iconName: "imgRenewGolfCart", title:"Register/Renew Golf Cart", type: .renewGolfCart, showArrow: true))
        arr.append(HomeVCTableItem(iconName: "imgCityHall", title:"City hall", type: .cityHall, showArrow: true))
        arr.append(HomeVCTableItem(iconName: "imgPublicSafety", title:"Public Safety", type: .publicSafety, showArrow: true))
        arr.append(HomeVCTableItem(iconName: "imgReportProblem", title:"Report a Problem", type: .reportAnIssue, showArrow: true))
        arr.append(HomeVCTableItem(iconName: "imgLibrary", title:"Library", type: .library, showArrow: true))
        
        arr.append(HomeVCTableItem(iconName: "imgRestaurants", title:"Restaurants", type: .restaurants, showArrow: true))
        arr.append(HomeVCTableItem(iconName: "imgShopping", title:"Shopping", type: .shopping, showArrow: true))
        arr.append(HomeVCTableItem(iconName: "imgCalendar", title:"Calendar", type: .calendar, showArrow: true))
        arr.append(HomeVCTableItem(iconName: "imgNotifyMe", title:"Notify Me", type: .notifyMe, showArrow: true))
        arr.append(HomeVCTableItem(iconName: "imgPools", title:"Pools", type: .pools, showArrow: true))

        arr.append(HomeVCTableItem(iconName: "imgRecreation", title:"Recreation & Special Events", type: .recreationAndSpecialEvent, showArrow: true))

        arr.append(HomeVCTableItem(iconName: "imgGolfCartHelp", title:"Golf Cart Help", type: .golfCartHelp, showArrow: true))
        arr.append(HomeVCTableItem(iconName: "imgCall911", title:"Call 911", type: .call911, showArrow: true))
        arr.append(HomeVCTableItem(iconName: "imgOnlinePayments", title:"Online Payments", type: .onlinePayment, showArrow: true))
    }
    
}

extension HomeVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (collectionVwHome.dequeueReusableCell(withReuseIdentifier: "HomeCollectionVWCell", for: indexPath) as? HomeCollectionVWCell)!
        let model = arr[indexPath.row]
        cell.lblName.text = model.title
        cell.imageVw.image = UIImage.init(named: (model.iconName)!)
             return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = arr[indexPath.row]
        if model.type == .shareMyLocation {
             self.openShareMyLocationVC()
        } else if model.type == .renewGolfCart {
            self.openWebViewVC("https://peachtree-city.org/216/Paths-Golf-Carts")
        } else if model.type == .cityHall {
            
        }  else if model.type == .publicSafety {
            if let controller = StoryboardUtils.getPublicSafety() as? PublicSafetyVC {
                controller.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(controller, animated: true)
            }
        } else if model.type == .reportAnIssue {
            self.openWebViewVC("https://peachtree-city.org/128/Report-a-Problem")
        } else if model.type == .library {
            
        } else if model.type == .restaurants {
            self.openRestaurantsVC()
        } else if model.type == .shopping {
            self.openShoppingVC()
        } else if model.type == .calendar {
            self.openWebViewVC("https://peachtree-city.org/calendar.aspx")
        } else if model.type == .notifyMe {
            self.openWebViewVC("https://peachtree-city.org/list.aspx")
        } else if model.type == .pools {
            
        } else if model.type == .recreationAndSpecialEvent {
            
        } else if model.type == .golfCartHelp {
            self.openGolfCartHelpVC()
        } else if model.type == .call911 {
            self.openCall911VC()
        } else if model.type == .onlinePayment {
            self.openWebViewVC("https://peachtree-city.org/list.aspx")
        } else if model.type == .settings {
            self.openMoreVC()
        }
     }
    
    func openRestaurantsVC() {
        if let controller = StoryboardUtils.getRestaurantsVC() as? RestaurantsVC {
            controller.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func openShoppingVC() {
        if let controller = StoryboardUtils.getShoppingVC() as? ShoppingVC {
            controller.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func openCall911VC() {
        if let controller = StoryboardUtils.getCall911VC() as? Call911VC {
            controller.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func openShareMyLocationVC() {
        if let controller = StoryboardUtils.getLocationVC() as? LocationVC {
            controller.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func openMoreVC() {
        if let controller = StoryboardUtils.getMoreVC() as? MoreVC {
            controller.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func openWebViewVC(_ webUrl:String) {
        if let controller = StoryboardUtils.getWebViewVC() as? WebViewVC {
            controller.strWebUrl = webUrl
            controller.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    
    func openGolfCartHelpVC() {
        if let controller = StoryboardUtils.getGolfCartHelpVC() as? GolfCartHelpVC {
            controller.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let noOfCellsInRow = 3

        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))

        return CGSize(width: size, height: size)
    }
}

class HomeVCTableItem<T> {
    var iconName: String?
    var title: String?
    var type: T?
    var showArrow: Bool?
    var isSelected: Bool? = false
    
    init(iconName: String?, title: String?, type: T?, showArrow: Bool?) {
        self.iconName = iconName
        self.title = title
        self.type = type
        self.showArrow = showArrow
    }
}

class MoreItem<T> {
    var title: String?
    var type: T?
    var iconName: String?
    
    init(iconName: String?,title: String?, type: T?) {
        self.iconName = iconName
        self.title = title
        self.type = type
    }
}
