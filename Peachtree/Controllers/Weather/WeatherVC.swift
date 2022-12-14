//
//  WeatherVC.swift
//  Peachtree
//
//  Created by Anand on 31/08/22.
//

import UIKit

class WeatherVC: UIViewController {
    // ----------------------------------
    //  MARK: - IB-OUTLET(S)
    //
    @IBOutlet private weak var lblTemp: UILabel!
    @IBOutlet private weak var lblCity: UILabel!
    @IBOutlet private weak var lblMainDes: UILabel!
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!

    @IBOutlet private var collectionViewDailyForcast: UICollectionView!
    @IBOutlet private var collectionViewWeeklyForecast: UICollectionView!
    var weekArr = ["MON","TUE","WED","THU","FRI","SAT","SUN"]
    // ----------------------------------
    //  MARK: - VIEW LOADING
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNeedsStatusBarAppearanceUpdate()
        if !(UIDevice.current.hasNotch)  {
            headerViewHeight.constant = 80
        }
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
            let temp = Int(ceil(((333 - 273.15) * 9/5) + 32))
            cell.lblTemp.text = String(format: "%i", temp)
            cell.lblTime.text = "3 Pm"
            return cell
        }
        
        let cellWeekly = collectionViewWeeklyForecast.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! WeeklyForecastCollectionCell
        cellWeekly.lblDayName.text = weekArr[indexPath.row]
        cellWeekly.lblMaxMinTemp.text = "44"
        return cellWeekly
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        print(collectionViewDailyForcast.frame.size.height)
        
        if collectionView == collectionViewDailyForcast{
            
            return CGSize(width: collectionViewDailyForcast.frame.size.height / 1.35, height: collectionViewDailyForcast.frame.size.height)
            
        } else if collectionView == collectionViewWeeklyForecast{
            
            return CGSize(width: collectionViewWeeklyForecast.frame.size.height / 1.37, height: collectionViewWeeklyForecast.frame.size.height)
        }
        
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}

