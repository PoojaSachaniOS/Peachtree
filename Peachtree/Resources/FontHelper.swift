
import Foundation
import UIKit

struct FontHelper {
    
    static func satoshiRegularFontWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: FontHelper.AppFont.californian_fontBold, size: size)!
    }
    
    static func satoshiMediumFontWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: FontHelper.AppFont.fontMedium, size: size)!
    }
    
    static func satoshiBoldFontWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: FontHelper.AppFont.californian_fontBold, size: size)!
    }
    
    static func defaultSatoshiBoldFontWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: FontHelper.AppFont.fontSatoshiBold, size: size)!
    }

    static func defaultSatoshiRegularFontWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: FontHelper.AppFont.fontSatoshiRegular, size: size)!
    }

    
    static func californianBoldFontWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: FontHelper.AppFont.californian_fontBold, size: size)!
    }
    
    static func californianRegFontWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: FontHelper.AppFont.californian_fontRegular, size: size)!
    }
    
    struct AppFont {
        static let fontSatoshiRegular = "Satoshi-Regular"
        static let fontMedium = "Satoshi-Medium"
        static let fontSatoshiBold = "Satoshi-Bold"
        static let californian_fontRegular = "CalifornianFB-Reg"
        static let californian_fontBold = "CalifornianFB-Bold"
    }
    
}
