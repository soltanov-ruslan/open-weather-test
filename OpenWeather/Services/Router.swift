//
//  Router.swift
//  OpenWeather
//
//  Created by Ruslan on 31.08.2022.
//

import Foundation
import UIKit

final class Router {
    static func showCity(_ from: UIViewController, current: OWCurrent) {
        let vc: CityController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CityController") as! CityController
        vc.current = current
        from.show(vc, sender: nil)
    }
    
    static func showMap(_ from: UIViewController, current: OWCurrent) {
        let vc: MapController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MapController") as! MapController
        vc.current = current
        from.show(vc, sender: nil)
    }
}
