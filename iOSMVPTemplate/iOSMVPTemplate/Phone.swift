//
//  Phone.swift
//  Cthullu
//
//  Created by Túlio Bazan da Silva on 02/05/17.
//  Copyright © 2017 Tulio Bazan. All rights reserved.
//

import Foundation

struct Phone {
    var countryCode: String?
    var areaCode: String?
    var phone: String?
    
    var detailString: String? {
        get {
            guard let countryCode = countryCode,
                let areaCode = areaCode,
                let phone = phone else { return nil }
            
            return "\(countryCode) \(areaCode) \(phone)"
        }
    }
    
    static func mock() -> Phone {
        return Phone(countryCode: "55", areaCode: "11", phone: "123456789")
    }
}
