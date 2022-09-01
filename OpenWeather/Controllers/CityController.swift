//
//  CityController.swift
//  OpenWeather
//
//  Created by Ruslan on 31.08.2022.
//

import UIKit

class CityController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var descrLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    var current: OWCurrent!
    private var data: [OWForecast] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerCell("OWForecastCell")
        setupUI()

        requestForecast()
    }
    
    // MARK: - UI
    
    private func setupUI() {
        navigationItem.title = current.name
        dateLbl.text = current.dt.toDateDay
        if let w = current.weather.first {
            descrLbl.text = w.description
            iconImg.af.setImage(withURL: w.iconUrl)
        }
    }
    
    // MARK: - Data
    
    private func requestForecast() {
        OWNetworker().getForecast(current.id) { response in
            print("OW forecast success", response.list.count)
            self.data = response.days
            self.tableView.reloadData()
        } failure: { error in
            print("OW forecast failure", error)
        }
    }
}

extension CityController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: OWForecastCell = tableView.dequeueCell(indexPath)
        cell.setup(data[indexPath.row])
        return cell
    }
}

