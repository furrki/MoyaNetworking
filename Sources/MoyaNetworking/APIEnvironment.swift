//
//  APIEnvironment.swift
//  
//
//  Created by Furkan Kaynar on 3.03.2020.
//

import Foundation

public protocol APIEnvironment {
    
    static var baseUrl: URL { get }
    static var jsClientId: String { get }
    static var empClientId: String { get }
    static var accessTokenBearer: String { get }
}

extension APIEnvironment {
    
    static var baseHeaders: [String: String] {
        return ["Content-Type": "application/json"]
    }
    
    static func authHeaders(for token: String) -> [String: String] {
        var headers = baseHeaders
        
        headers["Content-Type"] = "application/json"
        headers["Authorization"] = "\(accessTokenBearer) \(token)"
        
        return headers
    }
}
