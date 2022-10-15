//
//  ShoppingVM.swift
//  Peachtree
//
//  Created by Apple on 15/10/22.
//

import UIKit
import ObjectMapper
import CoreLocation

class ShoppingVM: NSObject {
    var vc: ShoppingVC?
    var aryShoppingModel = [RestaurantsModel]()
    var aryStoredShoppingModel = [RestaurantsModel]()
    var latitude : Double = 0.0
    var longitude : Double = 0.0
    var offsetValue : Int = 0
    var isLoadingMore : Bool = false
    var totalItems : Int = 0
    
    override init() {
        super.init()
        vc = ShoppingVC()
    }
    
    func fetchNearByRestaurants(searchText:String?,latitude:Double,longitude:Double,offset:Int,callBack: ((_ errMsg: String,_ success: Bool) -> Void)!) {
        
        let urlPathNearByRestaurants:String! =  "\("https://api.yelp.com/v3/businesses/search?latitude=")\(latitude)\("&longitude=")\(longitude)\("&sort_by=")\("distance")\("&limit=")\("50")\("&offset=")\(offsetValue)\("&radius=40000&term=")\(String(describing: searchText!))"
        
        ApiService.sendRequestForYelp(urlPath: urlPathNearByRestaurants, type: .get, parms: [:]) { response,suces in
            print("here is response", response)
            self.aryShoppingModel = self.aryStoredShoppingModel
            if let data = response["businesses"] as? [[String:AnyObject]] {
                let model : [RestaurantsModel] = Mapper<RestaurantsModel>().mapArray(JSONObject: data) ?? []
                self.aryShoppingModel.append(contentsOf: model)
            }
            self.totalItems = (response["total"] as? Int) ?? 0
            self.aryStoredShoppingModel = self.aryShoppingModel
            if self.offsetValue > 0 {
                if !((self.vc?.searchBar.text ?? "").isEmpty) {
                    self.vc?.filterData(self.vc?.searchBar.text ?? "")
                }
            }
            callBack("Successfully", true)
        } faliure: { errMsg, errCode in
            callBack(errMsg, false)
        }
    }
    
    func fetchRestaurants() {
        if latitude == 0.0 {
            LocationManager.shared.getLocation { (location:CLLocation?, error:NSError?) in
                if let error = error {
                    self.alertMessage(message: error.localizedDescription, buttonText: "OK", completionHandler: nil)
                    return
                }
                guard let location = location else {
                    self.alertMessage(message: "Unable to fetch location", buttonText: "OK", completionHandler: nil)
                    return
                }
                self.latitude = (location.coordinate.latitude)
                self.longitude = (location.coordinate.longitude)
                self.fetchRestaurants(searchText: "shopping", latitude: (location.coordinate.latitude), longitude: (location.coordinate.longitude))
            }
        } else {
            self.fetchRestaurants(searchText: "shopping", latitude: self.latitude, longitude: self.longitude)
        }
        if isLoadingMore {
            if offsetValue > 0 {
              //  self.vc?.loaderView.showMessage("Loading...", animateLoader: true)
            }
        } else {
          // self.vc?.loaderView.hide()
        }
    }
    
    fileprivate func fetchRestaurants(searchText:String,latitude:Double,longitude:Double) {
        if self.offsetValue == 0 {
            ProgressIndicator.shared().show( at: (self.vc?.view)!)
        }
        self.fetchNearByRestaurants(searchText: searchText, latitude: latitude, longitude: longitude, offset: 0) { [weak self] errMsg, success in
            guard let strongSelf = self else { return }
            ProgressIndicator.shared().hide(at: self?.vc?.view ?? UIView())
            if success {
                print("here is success")
                if strongSelf.aryShoppingModel.count > 0 {
                    strongSelf.offsetValue += 50 //For pagination
                    strongSelf.isLoadingMore = false
                //    strongSelf.vc?.loaderView.hide()
                    if let viewController = strongSelf.vc {
                        viewController.tblVwShopping.reloadData()
                    }
                }
            }
        }
    }
    
    func alertMessage(message:String,buttonText:String,completionHandler:(()->())?) {
        let alert = UIAlertController(title: "Location", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonText, style: .default) { (action:UIAlertAction) in
            completionHandler?()
        }
        alert.addAction(action)
        if let viewcontroller = vc {
            viewcontroller.present(alert, animated: true, completion: nil)
        }
    }
}
