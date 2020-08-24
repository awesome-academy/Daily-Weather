//
//  HeaderTableView.swift
//  WeatherAppProject1
//
//  Created by Nguyen Tien Cong on 8/10/20.
//  Copyright © 2020 Nguyen Tien Cong. All rights reserved.
//

import UIKit
import CoreLocation

class HeaderTableView: UITableViewHeaderFooterView {
    @IBOutlet weak var currentLocationLabel: UILabel!
    @IBOutlet weak var currentStatusLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor(red: 52/255.0, green: 109/255.0, blue: 179/255.0, alpha: 1.0)
    }

    static let identifier = "HeaderTableView"
    
    static func nib() -> UINib {
        return UINib(nibName: "HeaderTableView",
                     bundle: nil)
    }
    
    func configure(with model: Current) {
        CoordinateData.coor.updateCoor()
        self.currentTempLabel.text = "\(model.temperature)°"
        self.currentStatusLabel.text = model.weather.description
        self.currentLocationLabel.text = LocationData.location.getAddressFromLatLon(lat: CoordinateData.coor.lat, lon: CoordinateData.coor.lon)
    }
}


