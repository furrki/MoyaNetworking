//
//  File.swift
//  
//
//  Created by Furkan Kaynar on 5.03.2020.
//

import Foundation
import Moya

public protocol Service {
    associatedtype E: APIEnvironment
    
    var baseURL: URL { get }
    var path: String { get }
    var method: Moya.Method { get }
    var task: Task { get }
    var headers: [String: String]? { get }
    var responseType: ResponseType { get }
}
