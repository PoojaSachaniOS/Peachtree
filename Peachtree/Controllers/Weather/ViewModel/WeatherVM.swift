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

    func getWeatherAPI(lat: String, lon: String, callBack: ((_ errMsg: String,_ success: Bool) -> Void)!) {
        let weatherApi = WeatherApi(key: Constants.AppApiKeys.kOpenWeatherMapApiKey)
        weatherApi.getForecastFor(lat: lat, lon: lon) { result in
            switch result {
            case .success(let weather):
                print(weather)
                self.weatherData = weather
                callBack("Successfully", true)

            case .error(_):
                callBack("Failure", true)
                break
            }
        }

    }
}
