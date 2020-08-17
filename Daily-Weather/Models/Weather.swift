//
//  Weather.swift
//  Daily-Weather
//
//  Created by Nguyen Tien Cong on 8/17/20.
//  Copyright © 2020 Nguyen Tien Cong. All rights reserved.
//

import Foundation

struct Weather: Codable  {
    var id : Int
    var main : String
    var description : String
    var icon : String
}

