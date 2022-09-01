//
//  OWModels.swift
//  OpenWeather
//
//  Created by Ruslan on 31.08.2022.
//

import Foundation

struct OWWeather: Codable {
    var main: String
    var description: String
    var icon: String
}

struct OWMain: Codable {
    var temp_min: Float
    var temp_max: Float
}

struct OWCoord: Codable {
    var lon: Double
    var lat: Double
}

extension OWWeather {
    var iconUrl: URL { URL(string: OWConstants.iconPath(icon))! }
}
