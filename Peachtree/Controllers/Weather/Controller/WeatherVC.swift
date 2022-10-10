//
//  WeatherVC.swift
//  Peachtree
//
//  Created by Anand on 31/08/22.
//

import UIKit
import OpenWeatherKit
import CoreLocation

class WeatherVC: CustomBaseVC {
    // ----------------------------------
    //  MARK: - IB-OUTLET(S)
    //
    @IBOutlet private weak var lblTemp: UILabel!
    @IBOutlet private weak var lblCity: UILabel!
    @IBOutlet private weak var lblMainDes: UILabel!
    
    @IBOutlet private weak var vwForDailyWeather: UIView!
    @IBOutlet private weak var vwForWeeklyWeather: UIView!
    
    @IBOutlet private var collectionViewDailyForcast: UICollectionView!
    @IBOutlet private var collectionViewWeeklyForecast: UICollectionView!
    
    let weatherVM = WeatherVM()
    
    //Location variables
    var weatherResult: Result?

    var locationRequest = LocationManager.shared
    // ----------------------------------
    //  MARK: - VIEW LOADING
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Weather"
        self.setCollectionVwHideOrShow()
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.callWeatherAPI()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setCollectionVwHideOrShow(isHidden:Bool=true) {
        self.collectionViewDailyForcast.isHidden = isHidden
        self.collectionViewWeeklyForecast.isHidden = isHidden
       // self.vwForDailyWeather.isHidden = isHidden
        self.vwForWeeklyWeather.isHidden = isHidden
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
        if collectionView == collectionViewDailyForcast {
            return self.weatherResult?.hourly.count ?? 0
        } else {
            let count = self.weatherResult?.daily.count ?? 0
            return count==0 ? count : count-1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == collectionViewDailyForcast {
            let cell = collectionViewDailyForcast.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DailyForecastCollectionCell
            cell.layoutIfNeeded()
            if let hourlyData = self.weatherResult?.hourly[indexPath.row] {
                let date = Date(timeIntervalSince1970: Double(hourlyData.dt))
                let hourString = Date.getHourFrom(date: date)
                let weatherIconName = hourlyData.weather.first?.icon
                let weatherTemperature = hourlyData.temp
                cell.lblTemp.text = "\(Int(weatherTemperature.rounded()))°F"
                cell.imageVw.image = UIImage(named: weatherIconName ?? "")
                cell.lblTime.text = hourString
            }
            return cell
        }
        
        let cellWeekly = collectionViewWeeklyForecast.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! WeeklyForecastCollectionCell
        cellWeekly.layoutIfNeeded()
        if let dailyData = self.weatherResult?.daily[indexPath.row+1] {
            let weatherTemperature = dailyData.temp.day
            cellWeekly.lblMaxMinTemp.text = "\(Int(weatherTemperature.rounded()))°F"
            if let weatherIconName = dailyData.weather.first?.icon {
                cellWeekly.imageVwWeather.image = UIImage(named: weatherIconName)
            }
            let date = Date(timeIntervalSince1970: Double(dailyData.dt))
            let dayString = Date.getDayOfWeekFrom(date: date)
            cellWeekly.lblDayName.text = dayString
        }
        return cellWeekly
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionViewWeeklyForecast.frame.size.height / 2.3, height: collectionViewWeeklyForecast.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension WeatherVC {
    private func callWeatherAPI() {
        var loc = CLLocation()
        LocationManager.shared.getLocation { (location:CLLocation?, error:NSError?) in
            if let error = error {
                self.alertMessage(message: error.localizedDescription, buttonText: "OK", completionHandler: nil)
                return
            }
            guard let location = location else {
                self.alertMessage(message: "Unable to fetch location", buttonText: "OK", completionHandler: nil)
                return
            }
            loc = location
            self.weatherVM.getWeather(lat: "\(location.coordinate.latitude)", long: "\(location.coordinate.longitude)") { result in
                self.weatherResult = result
                self.setCollectionVwHideOrShow(isHidden:false)
                if let currentTemp = self.weatherResult?.current.temp {
                    self.lblTemp.text = "\(Int(currentTemp.rounded()))°F"
                }
                self.updateViews()
                LocationManager.shared.getReverseGeoCodedLocation(location: loc) { location, placemark, error in
                    self.lblCity.text = placemark?.locality ?? ""
                    self.lblMainDes.text = placemark?.administrativeArea ?? ""
                }
            } onError: { errorMessage in
                debugPrint(errorMessage)
            }
        }
    }

    func updateViews() {
        self.collectionViewDailyForcast.reloadData()
        self.collectionViewWeeklyForecast.reloadData()
    }
}
