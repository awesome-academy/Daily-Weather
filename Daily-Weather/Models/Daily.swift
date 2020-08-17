//
//  Daily.swift
//  Daily-Weather
//
//  Created by Nguyen Tien Cong on 8/17/20.
//  Copyright © 2020 Nguyen Tien Cong. All rights reserved.
//

import Foundation

struct Daily: Codable  {
    var dt: Int
    var sunrise: Int
    var sunset: Int
    var temp: Temp
    var feels_like: FeelLike
    var pressure: Float
    var humidity: Float
    var dew_point: Float
    var wind_speed: Float
    var wind_deg: Float
    var weather: [Weather]
    var uvi: Float
    var clouds: Float
    var iconUrl: String {
        return "https://openweathermap.org/img/w/" + (weather.first?.icon ??  "") + ".png"
    }
}
