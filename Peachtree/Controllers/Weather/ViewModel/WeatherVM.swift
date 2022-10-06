//
//  WeatherVM.swift
//  Peachtree
//
//  Created by Anand on 06/10/22.
//

import Foundation
import OpenWeatherKit

class WeatherVM: NSObject {
    
    func getWeatherAPI(lat: String, lon: String, callBack: ((_ errMsg: String,_ success: Bool) -> Void)!) {
        let weatherApi = WeatherApi(key: Constants.AppApiKeys.kOpenWeatherMapApiKey)
        weatherApi.getForecastFor(lat: "latitude", lon: "longitude") { result in
            switch result {
            case .success(let weather):
                print(weather)
              //  self.weatherData = weather
                
                /*
                for (index,element) in self.weatherData.list.enumerated(){
                    
                    if index == 0 {
                        self.resultAppendData.append(element)
                    } else {
                        
                        let strPredate:String = self.convertDateFormatterToCompare(date: self.weatherData.list[index-1].dt_txt)
                        let strCurrentItem:String = self.convertDateFormatterToCompare(date: self.weatherData.list[index].dt_txt)
                        if strCurrentItem != strPredate{
                            self.resultAppendData.append(element)
                        }
                    }
                    
                }*/
                
                /*
            DispatchQueue.main.async {
            self.lblTemp.text = String(format: "%i\u{00B0}", Int(ceil(((self.weatherData.list[0].main.temp - 273.15) * 9/5) + 32)))
                    
                    self.lblCity.text = self.weatherData.city.name
                    self.lblMainDes.text = self.weatherData.list[0].weather[0].main
                    
                    DispatchQueue.main.async {
                        self.collectionViewDailyForcast .reloadData()
                        self.collectionViewWeeklyForecast.reloadData()
                        
                        self.collectionViewWeeklyForecast.setNeedsLayout()
                        self.collectionViewWeeklyForecast.layoutIfNeeded()
                    }
                    
                }*/
                
            case .error(_):
                
                break
            }
        }

    }
}
