//
//  File.swift
//  
//
//  Created by Furkan Kaynar on 4.03.2020.
//

import Foundation

struct API: APIType {
    typealias Environment = DevelopmentEnv
}

struct TestEnv: APIEnvironment {
    static var baseUrl: URL = URL(string: "")!
    static var jsClientId: String = ""
    static var empClientId: String = ""
}

struct DevelopmentEnv: APIEnvironment {
    static var baseUrl: URL = URL(string: "")!
    static var jsClientId: String = ""
    static var empClientId: String = ""
}
