//
//  Homejson.swift
//  CryptoN
//
//  Created by Hilmihan Çalışan on 18.11.2022.
//

import Foundation

struct JsonOne {
    
    var userId : Int
    var id : Int
    var title : String
    var body : String
    
    init(_ dictionary: [String: Any]) {
        
        self.userId = dictionary["userId"] as? Int ?? 0
        self.id = dictionary["id"] as? Int ?? 0
        self.title = dictionary["title"] as? String ?? ""
        self.body = dictionary["body"] as? String ?? ""
    }
}
