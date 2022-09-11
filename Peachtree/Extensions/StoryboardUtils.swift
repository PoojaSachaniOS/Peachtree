

import UIKit

enum StoryboardUtils : String {
    
    case UserAuthentication, HomeTabBar, Home, Location , More
    
    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T : UIViewController>(viewControllerClass : T.Type, function : String = #function, line : Int = #line, file : String = #file) -> T {
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        guard let scene = instance.instantiateViewController(withIdentifier: storyboardID) as? T else {
            fatalError("ViewController with identifier \(storyboardID), not found in \(self.rawValue) Storyboard.\nFile : \(file) \nLine Number : \(line) \nFunction : \(function)")
        }
        return scene
    }
    
    func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}

extension UIViewController{
    
    class var storyboardID : String {
        return "\(self)"
    }
    
    static func instantiate(fromAppStoryboard appStoryboard: StoryboardUtils) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
    
}

extension StoryboardUtils{
    
    static func getGetStartedVC()-> UIViewController{
        return UserAuthentication.instance.instantiateViewController(withIdentifier: "GetStartedVC")
    }
    
    static func getTermsOfUseVC()-> UIViewController{
        return UserAuthentication.instance.instantiateViewController(withIdentifier: "TermsOfUseVC")
    }
    
    static func getPublicSafety()-> UIViewController{
        return Home.instance.instantiateViewController(withIdentifier: "PublicSafetyVC")
    }
    
    static func getHomeTabBar()-> UITabBarController {
        return HomeTabBar.instance.instantiateViewController(withIdentifier: "HomeTabBarController") as! UITabBarController
    }
    
    static func getLocationVC()-> UIViewController{
        return Location.instance.instantiateViewController(withIdentifier: "LocationVC")
    }
    
    static func getWebViewVC()-> UIViewController{
        return Home.instance.instantiateViewController(withIdentifier: "WebViewVC")
    }
    
    static func getMoreVC()-> UIViewController{
        return More.instance.instantiateViewController(withIdentifier: "MoreVC")
    }
    
    static func getShareVC()-> UIViewController{
        return More.instance.instantiateViewController(withIdentifier: "ShareVC")
    }
    
    static func getAppVersionVC()-> UIViewController{
        return More.instance.instantiateViewController(withIdentifier: "AppVersionVC")
    }
    
    static func getRateUsVC()-> UIViewController{
        return More.instance.instantiateViewController(withIdentifier: "RateUsVC")
    }
    
    static func getContactUsVC()-> UIViewController{
        return More.instance.instantiateViewController(withIdentifier: "ContactUsVC")
    }
    
    static func getCall911VC()-> UIViewController{
        return Home.instance.instantiateViewController(withIdentifier: "Call911VC")
    }
    
    static func getGolfCartHelpVC()-> UIViewController{
        return Home.instance.instantiateViewController(withIdentifier: "GolfCartHelpVC")
    }
    
    static func getRestaurantsVC()-> UIViewController{
        return Home.instance.instantiateViewController(withIdentifier: "RestaurantsVC")
    }
    
    static func getShoppingVC()-> UIViewController{
        return Home.instance.instantiateViewController(withIdentifier: "ShoppingVC")
    }
    
    static func getRestaurantsDetailsVC()-> UIViewController{
        return Home.instance.instantiateViewController(withIdentifier: "RestaurantsDetailsVC")
    }
    
    static func getDirectionPopUpVC()-> UIViewController{
        return Home.instance.instantiateViewController(withIdentifier: "DirectionPopUpVC")
    }
    
    static func getPoolsVC()-> UIViewController{
        return Home.instance.instantiateViewController(withIdentifier: "PoolsVC")
    }
}
