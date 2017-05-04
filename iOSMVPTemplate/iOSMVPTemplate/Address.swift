//
//  Address.swift
//  Cthullu
//
//  Created by Túlio Bazan da Silva on 25/04/17.
//  Copyright © 2017 Guilherme Machado. All rights reserved.
//

import UIKit

struct Address {
    var id: NSNumber?
    var country: String?
    var state: String?
    var zipCode: String?
    
    static func mock() -> Address {
        return Address(id: 1234,
                       country: "Brasil",
                       state: "São Paulo",
                       zipCode: "12345-123")
    }
}
