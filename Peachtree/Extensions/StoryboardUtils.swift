

import UIKit

enum StoryboardUtils : String {
    
    case UserAuthentication, HomeTabBar, Home, Location
    
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
    
    static func getHomeTabBar()-> UITabBarController {
        return HomeTabBar.instance.instantiateViewController(withIdentifier: "HomeTabBarController") as! UITabBarController
    }
    
    static func getLocationVC()-> UIViewController{
        return Location.instance.instantiateViewController(withIdentifier: "LocationVC")
    }
    
    static func getWebViewVC()-> UIViewController{
        return Home.instance.instantiateViewController(withIdentifier: "WebViewVC")
    }
}
