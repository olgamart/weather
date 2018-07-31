//
//  Weather.swift
//  Weather
//
//  Created by Olga Martyanova on 30/07/2018.
//  Copyright © 2018 olgamart. All rights reserved.
//

import Foundation
import SwiftyJSON

class Weather {
    var date = 0.0
    var temp = 0.0
    var pressure = 0.0
    var humidity = 0
    var weatherName = ""
    var weatherIcon = ""
    var windSpead = 0.0
    var windDegree = 0.0
    
    init(json: JSON) {
        self.date = json["dt"].doubleValue
        self.temp = json["main"]["temp"].doubleValue
        self.pressure = json["main"]["pressure"].doubleValue
        self.humidity = json["main"]["humidity"].intValue
        self.weatherName = json["weather"][0]["main"].stringValue
        self.weatherIcon = json["weather"][0]["icon"].stringValue
        self.windSpead = json["wind"]["speed"].doubleValue
        self.windDegree = json["wind"]["deg"].doubleValue
    }
}
