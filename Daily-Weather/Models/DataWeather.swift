//
//  DataWeather.swift
//  Daily-Weather
//
//  Created by Nguyen Tien Cong on 8/17/20.
//  Copyright © 2020 Nguyen Tien Cong. All rights reserved.
//

import Foundation

struct DataWeather: Codable {
    var lat: Float
    var lon: Float
    var timezone: String
    var timezone_offset: Int
    var current: Current
    var hourly: [Hourly]
    var daily: [Daily]
}

