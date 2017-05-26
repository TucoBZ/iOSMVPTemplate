//
//  Freelancer.swift
//  Cthullu
//
//  Created by Túlio Bazan da Silva on 25/04/17.
//  Copyright © 2017 Guilherme Machado. All rights reserved.
//

import UIKit
import Firebase

struct Freelancer {
    var id: String
    var name: String?
    var email: String?
    var phone: String?
    var createdDate: Date = Date()
    let ref: FIRDatabaseReference?
    
    init(id: String, createdDate: Date?, name: String, email: String, phone: String) {
        self.name = name
        self.email = email
        self.phone = phone

        let createdDate = createdDate ?? Date()
        self.createdDate = createdDate
     
        self.id = id
        
        self.ref = nil
    }

    
    init(snapshot: FIRDataSnapshot) {
        id = snapshot.key ?? ""
        let snapshotValue = snapshot.value as! [String: AnyObject]
        
        name = snapshotValue["name"] as? String
        email = snapshotValue["email"] as? String
        phone = snapshotValue["phone"] as? String
        
        createdDate = Date.init(timeIntervalSince1970: TimeInterval((snapshotValue["createdDate"] as! NSNumber).intValue))
        
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        return [
            "id":  id ?? "",
            "name":  name ?? "",
            "email": email ?? "",
            "phone": phone ?? "",
            "createdDate": createdDate.timeIntervalSince1970
        ]
    }

}

extension Freelancer: CellApresentable {
    
    var cellNib : UINib? {
        return UINib(nibName: "FreelaTableViewCell", bundle: nil)
    }
    
    var cellIndentifier : String {
        return "FreelaListCellIndentifier"
    }
    
    var hasDetail : Bool {
        return true
    }
    
    func fetchDetail(completion: ((UIViewController) -> Void)?) {
        
    }
}
