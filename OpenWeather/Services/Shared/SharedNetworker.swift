//
//  SharedNetworker.swift
//  OpenWeather
//
//  Created by Ruslan on 31.08.2022.
//

import Foundation
import Alamofire

class SharedNetworker {
    func request<T: Decodable>(_ convertible: URLConvertible, parameters: Parameters? = nil, success: @escaping (T) -> Void, failure: @escaping (String) -> Void) {
        AF.request(convertible, parameters: parameters).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success:
                guard let value = response.value else { return failure("Parse error") }
                success(value)
            case let .failure(error):
                failure(error.localizedDescription)
            }
            
        }
    }
}
