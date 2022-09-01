//
//  OWResponses.swift
//  OpenWeather
//
//  Created by Ruslan on 31.08.2022.
//

import Foundation

struct OWGroupResponse: Codable {
    var list: [OWCurrent]
}

struct OWCurrent: Codable {
    var dt: Int
    var id: Int
    var name: String
    var weather: [OWWeather]
    var main: OWMain
    var coord: OWCoord
}

struct OWForecastResponse: Codable {
    var list: [OWForecast]
}

struct OWForecast: Codable {
    var dt_txt: String
    var weather: [OWWeather]
    var main: OWMain
}

extension OWForecastResponse {
    var days: [OWForecast] {
        var ds: [OWForecast] = []
        for h in list {
            if let day = h.dt_txt.components(separatedBy: " ").first {
                if let index = (ds.firstIndex { $0.dt_txt == day }) {
                    if ds[index].main.temp_min > h.main.temp_min {
                        ds[index].main.temp_min = h.main.temp_min
                    }
                    if ds[index].main.temp_max < h.main.temp_max {
                        ds[index].main.temp_max = h.main.temp_max
                    }
                } else {
                    var hour = h
                    hour.dt_txt = day
                    ds += [hour]
                }
            }
        }
        return ds
    }
}
