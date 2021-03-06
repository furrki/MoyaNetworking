//
//  File.swift
//  
//
//  Created by Furkan Kaynar on 5.03.2020.
//

import Foundation
import Moya

public enum APIError: Error {
    
    case moya(MoyaError)
    case decoding(Error)
    case server(String)
    case unknow
    
}

// MARK: - LocalizedError
extension APIError: LocalizedError {
    
    var unknownErrorMessage: String {
        return "Bilinmeyen bir hata oluştu!"
    }
    
    public var errorDescription: String? {
        switch self {
        case .moya(let error):
            return error.localizedDescription
        case .decoding(let error):
            return error.localizedDescription
        case .server(let message):
            return message
        case .unknow:
            return unknownErrorMessage
        }
    }
    
    public var localizedDescription: String {
        return errorDescription ?? unknownErrorMessage
    }
    
}
