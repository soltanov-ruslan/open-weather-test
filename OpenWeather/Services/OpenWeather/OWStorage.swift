//
//  OWStorage.swift
//  OpenWeather
//
//  Created by Ruslan on 01.09.2022.
//

import Foundation

final class OWStorage {
    static let shared = OWStorage()
    
    let cities = [
        2643743,
        293396,
        5128581,
        2800866,
        3128760,
        2988507,
        1850147,
        1816670,
        2147714,
        3432043,
        4164138,
        6173331,
        524901,
        1609350,
        993800,
        2464470,
        1701668
    ]
    
    var unit: OWUnit = .metric
    func switchUnit() {
        unit = unit == .metric ? .imperial : .metric
    }
}
