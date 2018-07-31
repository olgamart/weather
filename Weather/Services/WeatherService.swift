//
//  WeatherService.swift
//  Weather
//
//  Created by Olga Martyanova on 27/07/2018.
//  Copyright © 2018 olgamart. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeatherService {
    // базовый url сервиса
    let baseUrl = "http://api.openweathermap.org"
    // ключ для доступа к сервису
    let apiKey = "92cabe9523da26194b02974bfcd50b7e"
    
    // метод для загрузки данных, в качестве аргумента получает город
    func loadWeatherData(city: String, completion: @escaping([Weather])->Void){
        // путь для получения погоды за 5 дней
        let path = "/data/2.5/forecast"
        // параметры, город, единицы измерения градусы, ключ для доступа к сервису
        let parameters: Parameters = [
            "q": city,
            "units": "metric",
            "appid": apiKey
        ]
        // составляем url из базового адреса сервиса и конкретного пути к ресурсу
        let url = baseUrl + path
        // делаем запрос
//        Alamofire.request(url, method: .get, parameters: parameters).responseJSON {repsonse in
//            print(repsonse.value!)
//        }
       Alamofire.request(url, method: .get, parameters: parameters).responseData {repsons in
        guard let data = repsons.value else {return}
        if let json =  try?JSON(data:data){
            let weather = json["list"].compactMap {Weather(json: $0.1)}
            completion(weather)
            }
        }
    }
}

