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


public enum AuthenticationService<E: APIEnvironment>: Service {
    case login (username: String, password: String)
    case autoLogin (token: String)
    case register (name: String, surname: String, email: String, phone: String, username:String, password: String)
    case forgotPassword (email: String, phone: String)
    case setFirebaseToken (token: String, firebaseToken: String)
}

extension AuthenticationService: TargetType {
    
    public var baseURL: URL {
        return E.baseUrl
    }
    
    public var path: String {
        switch self {
        case .login:
            return "User/GetUser"
        case .autoLogin:
            return "User/GetUser"
        case .register:
            return "User/Register"
        case .forgotPassword:
            return "User/ForgotPassword"
        case .setFirebaseToken:
            return "User/SetFirebaseToken"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .login:
            return .get
            
        case .autoLogin:
            return .get
                
        case .register:
            return .post
            
        case .forgotPassword:
            return .post
            
        case .setFirebaseToken:
            return .post
        }
    }
    
    public var task: Task {
        switch self {
        case .login:
            return .requestPlain
            
        case .autoLogin:
            return .requestPlain
            
        case .register(let name, let surname, let email, let phone, let username, let password):
            let params: [String: Any] = ["Name": name, "Surname": surname, "Email": email, "Phone": phone, "Username": username, "Password": password]
            
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
            
        case .forgotPassword(let email, let phone):
            let params: [String: Any] = ["Email": email, "Phone": phone]
            
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
            
        case .setFirebaseToken(_, let firebaseToken):
            let params: [String: Any] = ["Token": firebaseToken]
            print(params)
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
            
        }
    }
    
    public var headers: [String: String]? {
        switch self {
        case .login(let username, let password):
            var header = [String: String]()
            
            return header
            
        case .autoLogin(let token):
            return E.authHeaders(for: token)
        case .register:
            return E.baseHeaders
            
        case .forgotPassword:
            return E.baseHeaders
            
        case .setFirebaseToken (let token, _):
            return E.authHeaders(for: token)
            
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
}

// MARK: - ResponseTargetType
extension AuthenticationService: ResponseTargetType {
    public var responseType: ResponseType {
        switch self {
        case .login:
            return ResponseType(type: nil)
        case .autoLogin:
            return ResponseType(type: nil)
        case .register:
            return ResponseType(type: nil)
        case .forgotPassword:
            return ResponseType(type: nil)
        case .setFirebaseToken:
            return ResponseType(type: nil)
        }
    }
}
