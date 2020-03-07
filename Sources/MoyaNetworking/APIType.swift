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
//    static func getProvider<E, S: Service<E>>() -> MoyaProvider<Service<E>> {
//        return MoyaProvider<S<E>>()
//    }
//
    static var authenticationProvider: MoyaProvider<AuthenticationService<Environment>> {
        return MoyaProvider<AuthenticationService<Environment>>()
    }
}
