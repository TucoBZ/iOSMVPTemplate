//
//  Profile.swift
//  Cthullu
//
//  Created by Túlio Bazan da Silva on 25/04/17.
//  Copyright © 2017 Guilherme Machado. All rights reserved.
//

import UIKit

struct Profile {
    var id: NSNumber?
    var name: String?
    var address: Address?
    var email: String?
    var phone: Phone?
    var birthday: Date?
    
    static func mock() -> Profile {
        return Profile(id: 123,
                       name: "Jorge Lucas",
                       address: Address.mock(),
                       email: "jlucas@gmail.com",
                       phone: Phone.mock(),
                       birthday: Date())
    }
}
