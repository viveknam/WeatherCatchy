//
//  WeatherViewController.swift
//  WeatherCatchy
//
//  Created by datas solutions on 2/4/17.
//  Copyright © 2017 viveknamburu. All rights reserved.
//
import UIKit


class WeatherViewController: UIViewController, UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
  
    @IBOutlet weak var weatherTitle: UILabel!
    @IBOutlet weak var dateDisplay: UILabel!
    
    @IBOutlet weak var cityState: UILabel!
    
    
    @IBOutlet weak var imageDisplayView: UIImageView!
    
    @IBOutlet weak var currentTemperature: UILabel!
    
    @IBOutlet weak var currentWeatherType: UILabel!
    
    
    @IBOutlet weak var tableViewStream: UITableView!
    
    
    
    var apiData: PresentWeather!
    
    
    var searchURL = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiData = PresentWeather()
        self.tableViewStream.dataSource = self
        self.tableViewStream.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        
        //let cityname = searchBar.text
        //apiData.callAlamo(url: apiData.CURRENT_WEATHER_URL)
        apiData.downloadWeather {
                self.updateMainUi()
        }
        
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCatchingCell", for: indexPath)
        
        
        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let cityname = searchBar.text
        
        let addCityState =   cityname?.replacingOccurrences(of: " ", with: "%20")
        
        print(addCityState as Any)
        //apiData = PresentWeather()
        self.view.endEditing(true)//to dismiss keyboard after search
        
    }
    
    func updateMainUi() {
        dateDisplay.text = apiData.date
        currentTemperature.text = "\(apiData.currentTemp)"
        currentWeatherType.text = apiData.weatherType
        cityState.text = apiData.city
        imageDisplayView.image = UIImage(named: apiData.weatherType)
    }
    
}

