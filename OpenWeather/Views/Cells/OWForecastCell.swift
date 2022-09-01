//
//  OWForecastCell.swift
//  OpenWeather
//
//  Created by Ruslan on 31.08.2022.
//

import UIKit

class OWForecastCell: UITableViewCell {
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var tempMinLbl: UILabel!
    @IBOutlet weak var tempMaxLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(_ forecast: OWForecast) {
        dateLbl.text = forecast.dt_txt.toDateShortDay
        tempMinLbl.text = forecast.main.temp_min.toDegrees
        tempMaxLbl.text = forecast.main.temp_max.toDegrees
    }
}
