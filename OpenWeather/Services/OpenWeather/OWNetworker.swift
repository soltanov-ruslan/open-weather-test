//
//  OWNetworker.swift
//  OpenWeather
//
//  Created by Ruslan on 31.08.2022.
//

import Alamofire

final class OWNetworker: SharedNetworker {
    func getGroup(_ ids: [Int], success: @escaping (OWGroupResponse) -> Void, failure: @escaping (String) -> Void) {
        let parameters: Parameters = ["appid": OWConstants.key, "units": OWStorage.shared.unit.rawValue, "id": ids.map { String($0) }.joined(separator: ",")]
        request(OWConstants.url.group, parameters: parameters, success: success, failure: failure)
    }
    
    func getForecast(_ id: Int, success: @escaping (OWForecastResponse) -> Void, failure: @escaping (String) -> Void) {
        let parameters: Parameters = ["appid": OWConstants.key, "units": OWStorage.shared.unit.rawValue, "id": "\(id)"]
        request(OWConstants.url.forecast, parameters: parameters, success: success, failure: failure)
    }
}
