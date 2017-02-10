//
//  WeatherDatacons.swift
//  WeatherCatchy
//
//  Created by datas solutions on 2/5/17.
//  Copyright © 2017 viveknamburu. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?q=minneapolis"
//let CITY = "q= \("Minneapolis")"
let API_ID = "&APPID="
let API_KEY = "19e8b7870594c50e8a56682cdf61cff9"

typealias DownloadComplete = () -> ()

//http://api.openweathermap.org/data/2.5/weather?q=minneapolis&APPID=19e8b7870594c50e8a56682cdf61cff9


let CURRENT_WEATHER_URL = "\(BASE_URL)\(API_ID)\(API_KEY)"
