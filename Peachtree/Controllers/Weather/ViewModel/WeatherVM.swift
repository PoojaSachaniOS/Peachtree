//
//  WeatherVM.swift
//  Peachtree
//
//  Created by Anand on 06/10/22.
//

import Foundation
import OpenWeatherKit

class WeatherVM: NSObject {
    var resultAppendData = [Forecast.List]()
    var weatherData : Forecast!
    var URL_LATITUDE = "60.99"
    var URL_LONGITUDE = "30.0"
    let baseUrl = "https://api.openweathermap.org/data/2.5"
    let session = URLSession(configuration: .default)
    
    override init() {
        super.init()
      //  weatherVC = WeatherVC()
    }
    
    func setLatitude(_ latitude: String) {
        URL_LATITUDE = latitude
    }
    
    func setLatitude(_ latitude: Double) {
        setLatitude(String(latitude))
    }
    
    func setLongitude(_ longitude: String) {
        URL_LONGITUDE = longitude
    }
    
    func setLongitude(_ longitude: Double) {
        setLongitude(String(longitude))
    }

   /* func getWeatherAPI(lat: String = "36.0", lon: String = "72.0", callBack: ((_ errMsg: String,_ success: Bool) -> Void)!) {
        let weatherApi = WeatherApi(key: Constants.AppApiKeys.kOpenWeatherMapApiKey)
        weatherApi.getForecastFor(lat: URL_LATITUDE, lon: URL_LONGITUDE) { result in
            debugPrint("****** LATITUDE ******" + self.URL_LATITUDE)
            debugPrint("****** LONGITUDE ******" + self.URL_LONGITUDE)
            switch result {
            case .success(let weather):
                print(weather)
              //  self.weatherData = weather
                let items = try JSONDecoder().decode(Result.self, from: data)
                onSuccess(items)
                callBack("Successfully", true)
            case .error(_):
                callBack("Failure", true)
                break
            }
        }
    }*/
    
    
    func getWeather(onSuccess: @escaping (Result) -> Void, onError: @escaping (String) -> Void) {
        let url = baseUrl + "/onecall?lat=" + URL_LATITUDE + "&lon=" + URL_LONGITUDE + "&units=imperial" + "&appid=" + Constants.AppApiKeys.kOpenWeatherMapApiKey
        guard let url = URL(string: url) else {
            onError("Error building URL")
            return
        }
        
        let task = session.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    onError(error.localizedDescription)
                    return
                }
                guard let data = data, let response = response as? HTTPURLResponse else {
                    onError("Invalid data or response")
                    return
                }
                do {
                    if response.statusCode == 200 {
                        let items = try JSONDecoder().decode(Result.self, from: data)
                        onSuccess(items)
                    } else {
                        onError("Response wasn't 200. It was: " + "\n\(response.statusCode)")
                    }
                } catch {
                    onError(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
}
