//
//  ResponseTargetType.swift
//  
//
//  Created by Furkan Kaynar on 3.03.2020.
//

import Foundation

public protocol ResponseTargetType {
    var responseType: ResponseType { get }
}

public struct ResponseType {
    var type: Decodable.Type?
    public init(type: Decodable.Type?) {
        self.type = type
    }
}
