//
//  CitiesController.swift
//  OpenWeather
//
//  Created by Ruslan on 31.08.2022.
//

import UIKit

class CitiesController: UIViewController {
    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var unitBtn: UIBarButtonItem!
    
    // MARK: - Public props
    let cities = OWStorage.shared.cities
    
    // MARK: - Private props
    private var response: [OWCurrent] = []
    private var data: [OWCurrent] = []
    private var networker = OWNetworker()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerCell("OWWeatherCell")
        refreshUI()
        
        requestCities()
    }
}

// MARK: - Private methods
extension CitiesController {
    // MARK: - UI
    
    private func refreshUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: OWStorage.shared.unit.title, style: .plain, target: self, action: #selector(clickUnit))
    }
    
    // MARK: - Data
    
    private func requestCities() {
        networker.getGroup(cities) { response in
            print("OW group success", response.list.count)
            self.response = response.list
            self.refreshData()
        } failure: { error in
            print("OW group failure", error)
        }
    }
    
    private func refreshData() {
        if let search = searchBar.text, !search.isEmpty {
            data = response.filter { $0.name.lowercased().contains(search.lowercased()) }
        } else {
            data = response
        }
        tableView.reloadData()
    }
    
    // MARK: - Actions
    
    @IBAction func clickUnit(_ sender: Any) {
        OWStorage.shared.switchUnit()
        refreshUI()
        requestCities()
    }
    
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension CitiesController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = data[indexPath.row]
        let cell: OWWeatherCell = tableView.dequeueCell(indexPath)
        cell.setup(item) { [weak self] in
            guard let self = self else { return }
            Router.showMap(self, current: item)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        Router.showCity(self, current: data[indexPath.row])
    }
}

// MARK: - UISearchBarDelegate
extension CitiesController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        refreshData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
