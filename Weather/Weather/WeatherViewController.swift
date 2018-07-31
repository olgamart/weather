//
//  WeatherViewController.swift
//  Weather
//
//  Created by Olga Martyanova on 21/07/2018.
//  Copyright © 2018 olgamart. All rights reserved.
//

import UIKit

class WeatherViewController: UICollectionViewController {
    var weathers = [Weather]()
    let dateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        let weatherService = WeatherService()
        weatherService.loadWeatherData(city: "Moscow"){[weak self] weathers in
            self?.weathers = weathers
            self?.collectionView?.reloadData()
        }
    }

  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return weathers.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCell", for: indexPath) as? WeatherCell {
            let weather = weathers[indexPath.row]
            cell.weather.text = "\(weather.temp) C"
//            cell.time.text = "\(weather.date)"
            dateFormatter.dateFormat = "dd.MM.yyyy HH.mm"
            let date = Date(timeIntervalSince1970: weather.date)
            let stringDate = dateFormatter.string(from: date)
            cell.time.text = stringDate
            
            cell.icon.image = UIImage(named: weather.weatherIcon)
        return cell
        } else {return UICollectionViewCell()}
    

    
    }

    

}
