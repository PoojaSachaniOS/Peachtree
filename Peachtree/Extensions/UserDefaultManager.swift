
import UIKit

public class UserDefaultManager {
	
	static let sharedManager = UserDefaultManager()
	private var userDefault:UserDefaults = UserDefaults.standard
	
	func addValue(object:Any,key:String){
        userDefault.set(object, forKey: key)
		userDefault.synchronize()
	}
	
	func objectForKey(key:String) -> Any? {
		return userDefault.object(forKey: key) as AnyObject?
	}
	
	func removeValue(key:String){
		userDefault.removeObject(forKey: key)
		userDefault.synchronize()
	}
    
    //MARK: class methods
    
    class func getAccessToken() -> String {
        if UserDefaultManager.sharedManager.objectForKey(key: Constants.UserDefault.Key.kAccessToken) as? String != nil {
            return UserDefaultManager.sharedManager.objectForKey(key: Constants.UserDefault.Key.kAccessToken) as? String ?? ""
        }
        return ""
    }
    
    class func saveAccessToken(_ accessToken: String) {
        UserDefaults.standard.set(accessToken, forKey: Constants.UserDefault.Key.kAccessToken)
    }
    
    class func saveTermsAcceptedStatus(status:Bool) {
        UserDefaults.standard.set(status, forKey: Constants.UserDefault.Key.kAcceptedTerms)
        UserDefaults.standard.synchronize()
    }
    
    class func getTermsAcceptedStatus() -> Bool {
        return UserDefaults.standard.bool(forKey: Constants.UserDefault.Key.kAcceptedTerms)
    }
}
