//
//  OWWeatherCell.swift
//  OpenWeather
//
//  Created by Ruslan on 31.08.2022.
//

import UIKit
import AlamofireImage

class OWWeatherCell: UITableViewCell {
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var descrLbl: UILabel!
    @IBOutlet weak var tempMinLbl: UILabel!
    @IBOutlet weak var tempMaxLbl: UILabel!
    @IBOutlet weak var iconImg: UIImageView!
    
    var clickedMap: (() -> Void)?
    
    func setup(_ current: OWCurrent, clickedMap: @escaping () -> Void) {
        self.clickedMap = clickedMap
        nameLbl.text = current.name
        tempMinLbl.text = current.main.temp_min.toDegrees
        tempMaxLbl.text = current.main.temp_max.toDegrees
        if let w = current.weather.first {
            descrLbl.text = w.description
            iconImg.af.setImage(withURL: w.iconUrl)
        }
    }
    
    @IBAction func clickMap(_ sender: Any) {
        clickedMap?()
    }
}
