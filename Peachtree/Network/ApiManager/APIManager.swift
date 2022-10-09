

import UIKit
import Alamofire

class ApiService: NSObject {
    
    static var sessionManager: Session = {
        let sesionManager = Session.default
        return sesionManager
    }()
    
    class func sendRequest(urlPath: String, type: HTTPMethod, parms: Parameters?, success: ((_ responseObject: [String: Any], _ suces: Bool) -> Void)!, faliure: ((_ errMsg: String,_ errCode: Int) -> Void)!) {
        
        if !NetworkReachabilityManager()!.isReachable {
            print("here is network connection issue")
            faliure(Constants.ValidationMessages.internetAppearOffline, -1009)
            return
        }
        
        var request = URLRequest.init(url: URL.init(string: urlPath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!)
        let headers = ["Content-Type": "application/json"]
        
        /*
        let token =  UserDefaultManager.getAccessToken()
        if !token.isEmpty {
            print("here is token", token)
            headers["Authorization"] = String.init(format: "Bearer %@", token)
        }*/
        
        request.httpMethod = type.rawValue
        if !parms!.isEmpty {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parms ?? [:])
        }
        request.allHTTPHeaderFields = headers
        
        AF.request(request).responseJSON { response in
            switch response.result {
            case .success:
                print(response)
                if let responseObj: [String: Any] = response.value as?
                    [String: Any] {
                    if responseObj["success"] as? Bool == true {
                        success(responseObj,(Constants.APIResponseCodes.statusCodeSuccessful.rawValue != 0) )
                    } else {
                        success(responseObj,((responseObj["status"] as? Int) != nil))
                    }
                    
                } else {
                    faliure("Invalid Response", response.response?.statusCode ?? Constants.APIResponseCodes.statusCodeInternalServerError.rawValue)
                }
                break
            case .failure(let error):
                faliure("Invalid Response", response.response?.statusCode ?? Constants.APIResponseCodes.statusCodeInternalServerError.rawValue)
                print(error)
            }
        }
    }
    
    
    class func sendRequestForYelp(urlPath: String, type: HTTPMethod, parms: Parameters?, success: ((_ responseObject: [String: Any], _ suces: Bool) -> Void)!, faliure: ((_ errMsg: String,_ errCode: Int) -> Void)!) {
        
        if !NetworkReachabilityManager()!.isReachable {
            print("here is network connection issue")
            faliure(Constants.ValidationMessages.internetAppearOffline, -1009)
            return
        }
        
        var request = URLRequest.init(url: URL.init(string: urlPath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!)
        let headers = ["Authorization": "Bearer ze4a0ATk3f1265QYXHlveyqKvzHOfsj7ki5vr1o91EcWYKE4CQ3trP0-X1SaNlOtpaMAGQ6Z0tbXgKPKbT1CPFVr1NMsE60mHzUfRoffDHos_YRgtn_1GvBhpPyhW3Yx"]
        
        /*
        let token =  UserDefaultManager.getAccessToken()
        if !token.isEmpty {
            print("here is token", token)
            headers["Authorization"] = String.init(format: "Bearer %@", token)
        }*/
        
        request.httpMethod = type.rawValue
        if !parms!.isEmpty {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parms ?? [:])
        }
        request.allHTTPHeaderFields = headers
        
        AF.request(request).responseJSON { response in
            switch response.result {
            case .success:
                print(response)
                if let responseObj: [String: Any] = response.value as?
                    [String: Any] {
                    if responseObj["success"] as? Bool == true {
                        success(responseObj,(Constants.APIResponseCodes.statusCodeSuccessful.rawValue != 0) )
                    } else {
                        success(responseObj,((responseObj["status"] as? Int) != nil))
                    }
                    
                } else {
                    faliure("Invalid Response", response.response?.statusCode ?? Constants.APIResponseCodes.statusCodeInternalServerError.rawValue)
                }
                break
            case .failure(let error):
                faliure("Invalid Response", response.response?.statusCode ?? Constants.APIResponseCodes.statusCodeInternalServerError.rawValue)
                print(error)
            }
        }
    }

    
    
    class func networkConnected() -> Bool {
        return (NetworkReachabilityManager()?.isReachable)!
    }
    
    class func headers() -> HTTPHeaders {
        var headers: HTTPHeaders = [
            "Content-Type": "multipart/form-data",
        ]
        
        let token =  UserDefaultManager.getAccessToken()
        if !token.isEmpty {
            print("here is token", token)
            headers["Authorization"] = String.init(format: "Bearer %@", token)
        }
        return headers
    }
}
