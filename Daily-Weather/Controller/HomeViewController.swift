//
//  HomeViewController.swift
//  Daily-Weather
//
//  Created by Nguyen Tien Cong on 8/17/20.
//  Copyright © 2020 Nguyen Tien Cong. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
   
    @IBOutlet var table: UITableView!
    
    var dailyModels = [Daily]()
    var hourlyModels = [Hourly]()
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var current: Current?
    
    override func viewDidLoad() {
        
        //register cells
        
        table.register(HourlyTableViewCell.nib(), forCellReuseIdentifier: HourlyTableViewCell.identifier)
        table.register(WeatherTableViewCell.nib(), forCellReuseIdentifier: WeatherTableViewCell.identifier)
        
        table.dataSource = self
        table.delegate = self
        
        
        table.backgroundColor = UIColor(red: 52/255.0, green: 109/255.0, blue: 179/255.0, alpha: 1.0)
        view.backgroundColor = UIColor(red: 52/255.0, green: 109/255.0, blue: 179/255.0, alpha: 1.0)
        requestWeatherForLocation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupLocation()
    }
    
    //Location
    func setupLocation(){
        locationManager = CLLocationManager()
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
    
    func requestWeatherForLocation(){
        guard let currentLocation: CLLocationCoordinate2D = locationManager.location?.coordinate else { return }
        let lon = currentLocation.longitude
        let lat = currentLocation.latitude
        let url = "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&%20exclude=daily&appid=051eccdec971db6541e789fd524cfb66"
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {
            data, response, error in

            //validation
            guard let data = data, error == nil else {
                print("something is wrong")
                return
            }
            
            //Covert data to models/some object
            var json: DataWeather?
            do {
                json = try JSONDecoder().decode(DataWeather.self, from: data)
            }
            catch {
                print("error: \(error)")
            }
            guard let result = json else {
                return
            }
            print("count 1 \(result.daily.count) " )
            print("count 2 \(self.dailyModels.count) "  )
            let entries = result.daily

            self.dailyModels.append(contentsOf: entries)

            // Update user interface
            DispatchQueue.main.async {
                self.table.reloadData()
//                self.table.tableHeaderView = self.createTableHeader()
                print("debug")
            }
            }).resume()
    }
    
//    func createTableHeader() -> UIView {
//        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width))
//
//        headerView.backgroundColor = UIColor(red: 52/255.0, green: 109/255.0, blue: 179/255.0, alpha: 1.0)
//
//        let locationLabel = UILabel(frame: CGRect(x: 10, y: 10, width: view.frame.size.width-20, height: headerView.frame.size.height/5))
//        let summaryLabel = UILabel(frame: CGRect(x: 10, y: 20+locationLabel.frame.size.height, width: view.frame.size.width-20, height: headerView.frame.size.height/5))
//        let tempLabel = UILabel(frame: CGRect(x: 10, y: 20+locationLabel.frame.size.height+summaryLabel.frame.size.height, width: view.frame.size.width-20, height: headerView.frame.size.height/2))
//
//
//
//        tempLabel.textAlignment = .center
//        locationLabel.textAlignment = .center
//        summaryLabel.textAlignment = .center
//
//        locationLabel.text = "Current Location"
//
//        guard let currentWeather = self.current else {
//            return UIView()
//        }
//
//        tempLabel.text = "\(currentWeather.temp)°"
//        tempLabel.font = UIFont(name: "Helvetica-Bold", size: 32)
////        summaryLabel.text = String(self.current?.feelsLike)
//        headerView.addSubview(locationLabel)
//        headerView.addSubview(tempLabel)
//        headerView.addSubview(summaryLabel)
//        return headerView
//    }
    
    
    //table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if section == 0 {
//            // 1 cell that is collectiontableviewcell
//            return 1
//        }
        // return models count
        print("debug 3")
        return dailyModels.count
//        return 8

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//         if indexPath.section == 0 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: HourlyTableViewCell.identifier, for: indexPath) as! HourlyTableViewCell
//            cell.configure(with: hourlyModels)
//                   cell.backgroundColor = UIColor(red: 52/255.0, green: 109/255.0, blue: 179/255.0, alpha: 1.0)
////                cell.backgroundColor = UIColor.black
//                return cell
//               }
        
        print("debug2")
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as! WeatherTableViewCell
        cell.configure(with: dailyModels[indexPath.count])

        cell.backgroundColor = UIColor(red: 52/255.0, green: 109/255.0, blue: 179/255.0, alpha: 1.0)
        return cell

    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        createTableHeader()
//    }
    

}

