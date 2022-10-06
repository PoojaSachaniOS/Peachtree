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
    
    let weatherVM = WeatherVM()
    
    // ----------------------------------
    //  MARK: - VIEW LOADING
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Weather"
        self.setNeedsStatusBarAppearanceUpdate()
       // self.callWeatherAPI()
       
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
    private func callWeatherAPI() {
        self.weatherVM.getWeatherAPI(lat: "", lon: "") { [weak self] errMsg, success in
            guard let strongSelf = self else { return }
            strongSelf.view.hideLoadingIndicator()
            
            for (index,element) in strongSelf.weatherVM.weatherData.list.enumerated() {
                if index == 0 {
                    strongSelf.weatherVM.resultAppendData.append(element)
                } else {
                    let strPredate:String = TimeStamp.convertDateFormatterToCompare(date: strongSelf.weatherVM.weatherData.list[index-1].dt_txt)
                    let strCurrentItem:String = TimeStamp.convertDateFormatterToCompare(date: strongSelf.weatherVM.weatherData.list[index].dt_txt)
                    if strCurrentItem != strPredate {
                        strongSelf.weatherVM.resultAppendData.append(element)
                    }
                }
            }

            
            DispatchQueue.main.async {
                
         //       strongSelf.lblTemp.text = String(format: "%i\u{00B0}", Int(ceil(((strongSelf.weatherVM.weatherData.list[0].main.temp - 273.15) * 9/5) + 32)))
                    
                strongSelf.lblCity.text = strongSelf.weatherVM.weatherData.city.name
                strongSelf.lblMainDes.text = strongSelf.weatherVM.weatherData.list[0].weather[0].main
                    
                    DispatchQueue.main.async {
                        strongSelf.collectionViewDailyForcast .reloadData()
                        strongSelf.collectionViewWeeklyForecast.reloadData()
                        
                        strongSelf.collectionViewWeeklyForecast.setNeedsLayout()
                        strongSelf.collectionViewWeeklyForecast.layoutIfNeeded()
                    }
                    
                }
        }
    }
}
