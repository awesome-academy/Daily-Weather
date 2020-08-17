//
//  Current.swift
//  Daily-Weather
//
//  Created by Nguyen Tien Cong on 8/17/20.
//  Copyright © 2020 Nguyen Tien Cong. All rights reserved.
//

import Foundation

struct Current: Codable  {
    var dt: Int
    var sunrise: Int
    var sunset: Int
    var temp: Float
    var feels_like: Float
    var pressure: Float
    var humidity: Float
    var dew_point: Float
    var uvi: Float
    var clouds: Float
    var visibility: Float
    var wind_speed: Float
    var wind_deg: Float
    var weather: [Weather]
    var iconUrl: String {
        return "https://openweathermap.org/img/w/" + (weather.first?.icon ??  "") + ".png"
    }
}
