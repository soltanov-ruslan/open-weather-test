//
//  UITableView+Extensions.swift
//  OpenWeather
//
//  Created by Ruslan on 31.08.2022.
//

import UIKit

extension UITableView {
    func registerCell(_ name: String) {
        register(UINib(nibName: name, bundle: nil), forCellReuseIdentifier: name)
    }
    
    func dequeueCell<T: UITableViewCell>(_ indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as! T
    }
}
