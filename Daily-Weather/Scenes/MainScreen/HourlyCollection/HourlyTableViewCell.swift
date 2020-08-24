//
//  HourlyTableViewCell.swift
//  WeatherAppProject1
//
//  Created by Nguyen Tien Cong on 8/5/20.
//  Copyright © 2020 Nguyen Tien Cong. All rights reserved.
//

import UIKit

class HourlyTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    var models = [Hourly]()

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor(red: 52/255.0, green: 109/255.0, blue: 179/255.0, alpha: 1.0)
        collectionView.register(WeatherCollectionViewCell.nib(), forCellWithReuseIdentifier: WeatherCollectionViewCell.identifier)
        collectionView.backgroundColor = UIColor(red: 52/255.0, green: 109/255.0, blue: 179/255.0, alpha: 1.0)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    static let identifier = "HourlyTableViewCell"
       
       static func nib() -> UINib {
           return UINib(nibName: "HourlyTableViewCell", bundle: nil)
       }
    
    func configure(with models: [Hourly]) {
        self.models = models
        collectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherCollectionViewCell.identifier, for: indexPath) as! WeatherCollectionViewCell
        cell.timeLabel.text = String(indexPath.row)
        cell.configure(with: models[indexPath.row])
        return cell
    }
    
}
