//
//  DataTransform.swift
//  OpenWeather
//
//  Created by Ruslan on 01.09.2022.
//

import Foundation

final class DataTransform {
    static func formatted(timestamp: Int, to: String) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let formatter = DateFormatter()
        formatter.dateFormat = to
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        return formatter.string(from: date)
    }
    
    static func formatted(dateString: String, from: String, to: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = from
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        guard let date = formatter.date(from: dateString) else { return dateString }
        
        formatter.dateFormat = to
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        return formatter.string(from: date)
    }
}

extension Float {
    var toDegrees: String { "\(Int(self))\(OWStorage.shared.unit.symbol)" }
}

extension Int {
    var toDateDay: String { DataTransform.formatted(timestamp: self, to: "MMMM d") }
}

extension String {
    var toDateShortDay: String { DataTransform.formatted(dateString: self, from: "yyyy-MM-dd", to: "MMM d") }
}
