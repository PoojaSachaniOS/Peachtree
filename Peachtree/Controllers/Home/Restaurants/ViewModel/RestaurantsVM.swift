//
//  RestaurantsVM.swift
//  Peachtree
//
//  Created by Anand on 09/10/22.
//

import Foundation
import ObjectMapper
import CoreLocation

class RestaurantsVM: NSObject {
    var vc: RestaurantsVC?
    var aryRestaurantsModel = [RestaurantsModel]()
    var aryStoredRestaurantsModel = [RestaurantsModel]()
    var latitude : Double = 0.0
    var longitude : Double = 0.0
    var offsetValue : Int = 0
    var isLoadingMore : Bool = false
    var totalItems : Int = 0

    override init() {
        super.init()
        vc = RestaurantsVC()
    }
    
    func fetchNearByRestaurants(searchText:String?,latitude:Double,longitude:Double,offset:Int,callBack: ((_ errMsg: String,_ success: Bool) -> Void)!) {
        
        let urlPathNearByRestaurants:String! =  "\("https://api.yelp.com/v3/businesses/search?latitude=")\(latitude)\("&longitude=")\(longitude)\("&sort_by=")\("distance")\("&limit=")\("50")\("&offset=")\(offsetValue)\("&radius=40000&term=")\(String(describing: searchText!))"
        
        ApiService.sendRequestForYelp(urlPath: urlPathNearByRestaurants, type: .get, parms: [:]) { response,suces in
            print("here is response", response)
            
            if let data = response["businesses"] as? [[String:AnyObject]] {
                let model : [RestaurantsModel] = Mapper<RestaurantsModel>().mapArray(JSONObject: data) ?? []
                self.aryRestaurantsModel.append(contentsOf: model)
            }
            self.totalItems = (response["total"] as? Int) ?? 0
            self.aryStoredRestaurantsModel = self.aryRestaurantsModel
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
                self.fetchRestaurants(searchText: "Restaurants", latitude: (location.coordinate.latitude), longitude: (location.coordinate.longitude))
            }
        } else {
            self.fetchRestaurants(searchText: "Restaurants", latitude: self.latitude, longitude: self.longitude)
        }
        if isLoadingMore {
            if offsetValue > 0 {
                self.vc?.loaderView.showMessage("Loading...", animateLoader: true)
            }
        } else {
            self.vc?.loaderView.hide()
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
                if strongSelf.aryRestaurantsModel.count > 0 {
                    strongSelf.offsetValue += 50 //For pagination
                    strongSelf.isLoadingMore = false
                    strongSelf.vc?.loaderView.hide()
                    if let viewController = strongSelf.vc {
                        viewController.tblVwRestaurants.reloadData()
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

