
import UIKit


//MARK: progress bars
class HelperMethods {
    
    class func safeAreaInsets()->(top:CGFloat, bottom:CGFloat){
        if #available(iOS 11.0, *)  {
            let window = UIApplication.shared.keyWindow!
            let topPadding = window.safeAreaInsets.top
            let bottomPadding = window.safeAreaInsets.bottom
            return (top:topPadding, bottom:bottomPadding)
        }
        return (top:0, bottom:0)
    }
    
    /*
    class var hasTopNotch: Bool {
        if #available(iOS 11.0,  *) { return UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0 > 20 }
        return false
    }*/
}
