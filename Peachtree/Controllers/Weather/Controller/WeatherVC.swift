//
//  WeatherVC.swift
//  Peachtree
//
//  Created by Anand on 31/08/22.
//

import UIKit
import OpenWeatherKit

class WeatherVC: CustomBaseVC {
    // ----------------------------------
    //  MARK: - IB-OUTLET(S)
    //
    @IBOutlet private weak var lblTemp: UILabel!
    @IBOutlet private weak var lblCity: UILabel!
    @IBOutlet private weak var lblMainDes: UILabel!

    @IBOutlet private var collectionViewDailyForcast: UICollectionView!
    @IBOutlet private var collectionViewWeeklyForecast: UICollectionView!
    var weekArr = ["MON","TUE","WED","THU","FRI","SAT","SUN"]
     var resultAppendData = [Forecast.List]()
     var weatherData : Forecast!

    // ----------------------------------
    //  MARK: - VIEW LOADING
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Weather"
        self.setNeedsStatusBarAppearanceUpdate()
       
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

// ----------------------------------
//  MARK: - UICollectionViewDataSource UICollectionViewDelegate
//

extension WeatherVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewDailyForcast{
            return 10
        }else{
            return weekArr.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == collectionViewDailyForcast{
            let cell = collectionViewDailyForcast.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DailyForecastCollectionCell
            cell.layoutIfNeeded()
            let temp = Int(ceil(((333 - 273.15) * 9/5) + 32))
            cell.lblTemp.text = String(format: "%i", temp)
            cell.lblTime.text = "3 Pm"
            return cell
        }
        
        let cellWeekly = collectionViewWeeklyForecast.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! WeeklyForecastCollectionCell
        cellWeekly.layoutIfNeeded()
        cellWeekly.lblDayName.text = weekArr[indexPath.row]
        cellWeekly.lblMaxMinTemp.text = "44"
        return cellWeekly
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        print(collectionViewDailyForcast.frame.size.height)
        
        if collectionView == collectionViewDailyForcast {
            return CGSize(width: collectionViewDailyForcast.frame.size.height / 1.35, height: collectionViewDailyForcast.frame.size.height)
        } else if collectionView == collectionViewWeeklyForecast{
            return CGSize(width: collectionViewWeeklyForecast.frame.size.height / 1.35, height: collectionViewWeeklyForecast.frame.size.height)
        }
        
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}

extension WeatherVC {
    private func weatherAPI() {
            let weatherApi = WeatherApi(key: Constants.AppApiKeys.kOpenWeatherMapApiKey)
            weatherApi.getForecastFor(lat: "latitude", lon: "longitude") { result in
                switch result {
                case .success(let weather):
                    print(weather)
                    self.weatherData = weather
                    
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

    func convertDateFormatterToCompare(date: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        // dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
        // dateFormatter.locale = Locale(identifier: "your_loc_id")
        let convertedDate = dateFormatter.date(from: date)
        
        guard dateFormatter.date(from: date) != nil else {
            assert(false, "no date from string")
            return ""
        }
        
        dateFormatter.dateFormat = "yyyy-MM-dd"///this is what you want to convert format
        //  dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
        let timeStamp = dateFormatter.string(from: convertedDate!)
        
        return timeStamp
    }

}
