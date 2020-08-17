//
//  HeaderTableView.swift
//  WeatherAppProject1
//
//  Created by Nguyen Tien Cong on 8/10/20.
//  Copyright © 2020 Nguyen Tien Cong. All rights reserved.
//

import UIKit

class HeaderTableView: UITableViewHeaderFooterView {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static let identifier = "HeaderTableView"
    
    static func nib() -> UINib {
        return UINib(nibName: "HeaderTableView",
                     bundle: nil)
    }
    
    
    
}
