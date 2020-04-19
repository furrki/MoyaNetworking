//
//  File.swift
//  
//
//  Created by Furkan Kaynar on 5.03.2020.
//

import Foundation
import Moya

public protocol APIType {
    associatedtype Environment: APIEnvironment
}

public extension APIType {
    static func getProvider<S: Service>(service: S) -> MoyaProvider<S> {
        return MoyaProvider<S>()
    }
}
