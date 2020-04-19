//
//  Moya+Extension.swift
//  RefSale
//
//  Created by Furkan Kaynar on 30.08.2019.
//  Copyright © 2019 evdeuzman. All rights reserved.
//

import Foundation
import Moya
import Result

public extension MoyaProvider {
    func request<R: Decodable>(_ target: Target, response: R.Type, showLoading: Bool = true, completion: @escaping (_ result: Result<R, APIError>) -> Void) {
        request(target) { result in
            let decoder = DefaultDecoder()
            
            switch result {
            case .failure(let error):
                completion(Result.failure(APIError.moya(error)))
            case .success(let response):
                
                if let decodedData = try? response.map(R.self, using: decoder) { // Mapping plain JSON object
                    completion(Result.success(decodedData))
                } else {
                    completion(Result.failure(APIError.server("Decoding Problem")))
                }
            }
        }
    }
}
