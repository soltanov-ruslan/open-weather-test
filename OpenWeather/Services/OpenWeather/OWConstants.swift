//
//  OWConstants.swift
//  OpenWeather
//
//  Created by Ruslan on 31.08.2022.
//

import Foundation

struct OWConstants {
    static let key = "0cd74bf29e43ef1ad6afd6861cc99eb2"
    static let api = "https://api.openweathermap.org/data/2.5"
    static func iconPath(_ icon: String) -> String { "https://openweathermap.org/img/wn/\(icon)@2x.png" }
    
    struct url {
        static let group = "\(api)/group"
        static let forecast = "\(api)/forecast"
    }
}

enum OWUnit: String {
    case metric, imperial
    
    var title: String {
        switch self {
        case .metric: return "Celsius"
        case .imperial: return "Fahrenheit"
        }
    }
    
    var symbol: String {
        switch self {
        case .metric: return "C"
        case .imperial: return "F"
        }
    }
}
