//
//  PresentWeather.swift
//  WeatherCatchy
//
//  Created by datas solutions on 2/5/17.
//  Copyright © 2017 viveknamburu. All rights reserved.
//

import UIKit
import Alamofire








class PresentWeather {
    
    //var searchApiUrl = "http://api.openweathermap.org/data/2.5/weather?q=minneapolis&APPID=19e8b7870594c50e8a56682cdf61cff9"
    
    
    //http://api.openweathermap.org/data/2.5/weather?q=minneapolis&APPID=19e8b7870594c50e8a56682cdf61cff9
    
    
   
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    var _icon: String!
    var _sunrise: String!
    var _sunset: String!
    var _description: String!
    var _windSpeed: String!
    var _humidity: Double!
    var _cloud : String!
    var _WeatherUrl : String!
    
    
    
    
    
    var city :String {
        
            if _cityName == nil{
                
                _cityName = ""
            }
            return _cityName
        }
        
        
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
    if _currentTemp == nil {
    _currentTemp = 0.0
    }
        return _currentTemp
    }
    
    var date: String {
        if _date == nil {
            
            _date = ""
            
        }        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .long
        
        dateFormatter.timeStyle = .none
        
        let currentDate = dateFormatter.string(from: Date())
        
        self._date = "Today,\(currentDate)"
        
        return _date
        
    }
    



    
    //init ( city :String!) {
    //self._cityName = city
    // self._WeatherUrl = "\(BASE_URL)\(city)\(API_KEY)"
    //print(_WeatherUrl)
    // }
    // func convertMillibarsToInchesOfMercury(_ pressure: Double) -> Double {
    //return pressure * 0.0295333727
    //}
    //func convTemp(_ temp :Double) -> Double {
    
    //return temp - 273.15
    //}
    
   // func downloadweather (_ completed: @escaping  DownloadComplete)
    func downloadWeather(completed: DownloadComplete) {
    
        let callAlamo = URL(string: CURRENT_WEATHER_URL)!
            
       Alamofire.request(callAlamo).responseJSON(completionHandler: {
          response in
            self.dataParse(JSONData: response.data!)
            
            
        })
        completed()
    }
    func dataParse(JSONData : Data) {
        
        do{
            
            let readableJSON = try JSONSerialization.jsonObject(with: JSONData, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String : AnyObject]
            
            //print(readableJSON as Any)
            
            if let name = readableJSON["name"] as? String {
                self._cityName = name.capitalized
                 print(self._cityName)
            }
            
            if let weather = readableJSON["weather"] as? [[String:AnyObject]]{
                if  let main = weather[0]["main"] as? String{
                    self._weatherType = main.capitalized
                    print(self._weatherType)
                    
                }
                
            }
            if let dict3 = readableJSON["main"] as? [String:AnyObject]{
                if let currentTemp = dict3["temp"] as? Double{
                    let kelvinToFarenheitPre = (currentTemp * (9/5) - 459.67)
                    let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPre/10))
                    self._currentTemp = kelvinToFarenheit
                    print(self._currentTemp)
                }
            }
            if let dict1 = readableJSON["main"] as? [String:AnyObject]{
                if let humidity = dict1 ["humidity"] as? Double{
                    self._humidity = humidity
                    print(self._humidity)
                }
                
            }
            
        }
        catch{
            print(error)
        }
        
     }
    
    
   


    
}
