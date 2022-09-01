//
//  OWForecastCell.swift
//  OpenWeather
//
//  Created by Ruslan on 31.08.2022.
//

import UIKit

class OWForecastCell: UITableViewCell {
    @IBOutlet private weak var dateLbl: UILabel!
    @IBOutlet private weak var tempMinLbl: UILabel!
    @IBOutlet private weak var tempMaxLbl: UILabel!
    
    func setup(_ forecast: OWForecast) {
        dateLbl.text = forecast.dt_txt.toDateShortDay
        tempMinLbl.text = forecast.main.temp_min.toDegrees
        tempMaxLbl.text = forecast.main.temp_max.toDegrees
    }
}
