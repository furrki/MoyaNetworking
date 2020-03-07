//
//  DefaultDecoder.swift
//  
//
//  Created by Furkan Kaynar on 4.03.2020.
//

import Foundation

public class DefaultDecoder: JSONDecoder {    
    public override init() {
        super.init()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        dateDecodingStrategy = .formatted(dateFormatter)
    }
}
