//
//  WeatherTableViewCell.swift
//  WeatherAppProject1
//
//  Created by Nguyen Tien Cong on 8/6/20.
//  Copyright © 2020 Nguyen Tien Cong. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var lowTempLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor(red: 52/255.0, green: 109/255.0, blue: 179/255.0, alpha: 1.0)
        
    }

    static let identifier = "WeatherTableViewCell"

    static func nib() -> UINib {
        return UINib(nibName: "WeatherTableViewCell",
                     bundle: nil)
    }

    func configure(with model: Daily) {
        self.highTempLabel.textAlignment = .center
        self.lowTempLabel.textAlignment = .center
        self.lowTempLabel.text = "\(Int(model.temperature.min)-273)°"
        self.highTempLabel.text = "\(Int(model.temperature.max)-273)°"
        self.dayLabel.text = getDayForDate(Date(timeIntervalSince1970: Double(model.dt)))
        let url = URL (string: "https://openweathermap.org/img/w/" + (model.weather.first?.icon ??  "") + ".png")
        do{
            let d = try Data(contentsOf: url!)
            self.iconImageView.image = UIImage(data: d)
        } catch {
            print("khong load icon")
        }



    }

    func getDayForDate(_ date: Date?) -> String {
        guard let inputDate = date else {
            return ""
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE" // Monday
        return formatter.string(from: inputDate)
    }
    
}
