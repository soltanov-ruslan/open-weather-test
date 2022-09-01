//
//  MapController.swift
//  OpenWeather
//
//  Created by Ruslan on 01.09.2022.
//

import UIKit
import MapKit

class MapController: UIViewController {
    // MARK: - Outlets
    @IBOutlet private weak var mapView: MKMapView!
    
    // MARK: - Public props
    var current: OWCurrent!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - Private methods
extension MapController {
    // MARK: - UI
    
    private func setupUI() {
        let city = MKPointAnnotation()
        city.title = current.name
        city.coordinate = CLLocationCoordinate2D(latitude: current.coord.lat, longitude: current.coord.lon)
        mapView.addAnnotation(city)
        mapView.setCenter(city.coordinate, animated: false)
    }
}
