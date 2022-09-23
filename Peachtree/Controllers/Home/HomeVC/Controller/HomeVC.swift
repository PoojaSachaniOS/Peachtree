//
//  HomeVC.swift
//  Peachtree
//
//  Created by Anand on 31/08/22.
//

import UIKit

class HomeVC: CustomBaseVC {
    //  MARK: - IB-OUTLET(S)
    @IBOutlet weak var collectionVwHome: UICollectionView!
    
    var arr: [HomeVCTableItem<AccountVCTableItemType>] = []
    enum AccountVCTableItemType {
        case shareMyLocation, renewGolfCart, cityHall, publicSafety, reportAnIssue, library, restaurants, shopping, calendar, notifyMe, pools, recreationAndSpecialEvent, golfCartHelp, call911, onlinePayment, settings
    }
    
    private let animations = [AnimationType.vector((CGVector(dx: 0, dy: 260)))]
    private var btnTemp: UIButton!
    
    // MARK: - View Loading -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Home"
        self.configureSearchBarButtonItem()
        self.configureTempBarButtonItem()
        self.registerNib()
        self.initializeData()
        self.setNeedsStatusBarAppearanceUpdate()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
            // self.items = Array(repeating: nil, count: 15)
            self.collectionVwHome.reloadData()
            self.collectionVwHome.performBatchUpdates({
                UIView.animate(views: self.collectionVwHome.orderedVisibleCells,
                               animations: self.animations, completion: {
                })
            }, completion: nil)
        }
    }
    
    // MARK: - OVERRIDE METHOD(S)
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //  MARK: - PRIVATE METHOD(S)
    private func configureSearchBarButtonItem() {
        let leftBarbtn = UIBarButtonItem(image: UIImage.init(named: "imgSearch"), style: .plain, target: self, action:#selector(HomeVC.btnSearchTapped))
        leftBarbtn.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem  = leftBarbtn
    }
    
    @objc func btnSearchTapped() {
    }
    
    private func configureTempBarButtonItem() {
        btnTemp = UIButton(type: .custom)
        btnTemp.titleLabel?.numberOfLines = 0
        btnTemp.titleLabel?.font = FontHelper.californianBoldFontWithSize(size: 17)
        btnTemp.frame = CGRect()
        btnTemp.frame.size.width = 100
        btnTemp.frame.size.height = 50
        self.btnTemp.setTitle(String(format: "%i\u{00B0} F\n%@",80,"Clear"), for: .normal)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: btnTemp)
    }
    
    private func registerNib() {
        collectionVwHome.register(UINib(nibName: "HomeCollectionVWCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionVWCell")
    }
    
    private func initializeData() {
        arr.append(HomeVCTableItem(iconName: "imgShareMyLocation", title:"Share My Location", type: .shareMyLocation, showArrow: true))
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
        arr.append(HomeVCTableItem(iconName: "imgOnlinePayments", title:"More Info", type: .settings, showArrow: true))
    }
    
}

// MARK: - UICollectionView delegate & datasource
extension HomeVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (collectionVwHome.dequeueReusableCell(withReuseIdentifier: HomeCollectionVWCell.className, for: indexPath) as? HomeCollectionVWCell)!
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
            self.openWebViewVC("https://peachtree-city.org/216/Paths-Golf-Carts", title: model.title ?? "")
        } else if model.type == .cityHall {
            self.openCityHall()
           // self.openWebViewVC("https://peachtree-city.org/", title: model.title ?? "")
            
        }  else if model.type == .publicSafety {
            if let controller = StoryboardUtils.getPublicSafety() as? PublicSafetyVC {
                controller.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(controller, animated: true)
            }
        } else if model.type == .reportAnIssue {
            self.openWebViewVC("https://peachtree-city.org/128/Report-a-Problem", title: model.title ?? "")
        } else if model.type == .library {
            self.openLibrary()
           // self.openCategoriesVC(title: model.title ?? "Library")
        } else if model.type == .restaurants {
            self.openRestaurantsVC()
        } else if model.type == .shopping {
            self.openShoppingVC()
        } else if model.type == .calendar {
            self.openWebViewVC("https://peachtree-city.org/calendar.aspx", title: model.title ?? "")
        } else if model.type == .notifyMe {
            self.openWebViewVC("https://peachtree-city.org/list.aspx", title: model.title ?? "")
        } else if model.type == .pools {
            self.openCategoriesVC(title: model.title ?? "Pools")
        } else if model.type == .recreationAndSpecialEvent {
            self.openWebViewVC("https://peachtree-city.org/126/Recreation-Special-Events", title: model.title ?? "")
        } else if model.type == .golfCartHelp {
            self.openGolfCartHelpVC()
        } else if model.type == .call911 {
            self.openCall911VC()
        } else if model.type == .onlinePayment {
            self.openWebViewVC("https://peachtree-city.org/list.aspx", title: model.title ?? "")
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
    
    func openLibrary() {
        if let controller = StoryboardUtils.getLibraryVC() as? LibraryVC {
            controller.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func openCityHall() {
        if let controller = StoryboardUtils.getCityHallVC() as? CityHallVC {
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
    
    func openCategoriesVC(title: String) {
        if let controller = StoryboardUtils.getCategoriesVC() as? CategoriesVC {
            controller.hidesBottomBarWhenPushed = true
            controller.navigationItem.title = title
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func openShareMyLocationVC() {
        if let controller = StoryboardUtils.getShareMyLocationVC() as? ShareMyLocationVC {
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
    
    func openWebViewVC(_ webUrl:String, title: String) {
        if let controller = StoryboardUtils.getWebViewVC() as? WebViewVC {
            controller.strWebUrl = webUrl
            controller.strNavTitle = title
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
        
        /*
         let noOfCellsInRow = 3
         let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
         let totalSpace = flowLayout.sectionInset.left
         + flowLayout.sectionInset.right
         + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
         let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
         return CGSize(width: size, height: size)
         */
        
        let remaider = (Double(indexPath.item + 12)/3).truncatingRemainder(dividingBy: 15)
        let remaider1 = (Double(indexPath.item + 17)/3).truncatingRemainder(dividingBy: 3)
        let remaider2 = (Double(indexPath.item - 15)/3).truncatingRemainder(dividingBy: 3)
        
        if remaider == 0 {
            return CGSize(width: (collectionView.frame.size.width + 120)/2, height: 104)
        }
        
        else if remaider1 == 0 {
            return CGSize(width: (collectionView.frame.size.width + 120)/2, height: 104)
        }
        else if remaider2 == 0 {
            return CGSize(width: (collectionView.frame.size.width + 120)/2, height: 104)
        }
        
        return CGSize(width: (collectionView.frame.size.width - 9 )/3, height: 104)
        
    }
}

