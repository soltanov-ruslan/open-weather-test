//
//  MapController.swift
//  OpenWeather
//
//  Created by Ruslan on 01.09.2022.
//

import UIKit
import MapKit

class MapController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    var current: OWCurrent!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI
    
    private func setupUI() {
        let city = MKPointAnnotation()
        city.title = current.name
        city.coordinate = CLLocationCoordinate2D(latitude: current.coord.lat, longitude: current.coord.lon)
        mapView.addAnnotation(city)
        mapView.setCenter(city.coordinate, animated: false)
    }
}
