//
//  FreelaDetail.swift
//  Cthullu
//
//  Created by Túlio Bazan da Silva on 02/05/17.
//  Copyright © 2017 Tulio Bazan. All rights reserved.
//

import UIKit
import Firebase

struct FreelaDetail {
    var id: NSNumber?
    var title: String?
    var description: String?
    var type: FreelaType = .development
    var name: String?
    var email: String?
    var phone: String?
    var createdDate: Date = Date()
    let ref: FIRDatabaseReference?
    
    init(id: NSNumber?, title: String?, description: String?, type: FreelaType, name: String?, email: String?, phone: String?, createdDate: Date?) {
        let createdDate = createdDate ?? Date()
        self.createdDate = createdDate
        
        let id = id ?? NSNumber(value: createdDate.timeIntervalSince1970)
        self.id = id
    
        self.title = title
        self.description = description
        self.name = name
        self.email = email
        self.phone = phone
        self.type = type
        self.ref = nil
    }
    
    init(snapshot: FIRDataSnapshot) {
        id = NSNumber(value: Int(snapshot.key) ?? 0)
        let snapshotValue = snapshot.value as! [String: AnyObject]
        
        title = snapshotValue["title"] as? String
        description = snapshotValue["description"] as? String
        type = FreelaType(rawValue: snapshotValue["type"] as! String) ?? .development
        name = snapshotValue["name"] as? String
        email = snapshotValue["email"] as? String
        phone = snapshotValue["phone"] as? String
        createdDate = Date.init(timeIntervalSince1970: TimeInterval((snapshotValue["createdDate"] as! NSNumber).intValue))
        
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        return [
            "id":  id?.intValue ?? 0,
            "title": title ?? "",
            "description": description ?? "",
            "type": type.rawValue,
            "name":  name ?? "",
            "email": email ?? "",
            "phone": phone ?? "",
            "createdDate": createdDate.timeIntervalSince1970
        ]
    }

//    static func mock(freela: Freela) -> FreelaDetail{
//        return FreelaDetail(id: freela.id,
//                            title: freela.title,
//                            description: freela.description,
//                            type: freela.type,
//                            contact: "ahssaghjdgjhasgd12e7126e786",
//                            createdDate: freela.createdDate)
//    }
    
    var freela: Freela {
        return Freela(id: id, title: title, description: description, type: type, createdDate: createdDate)
    }
}

extension FreelaDetail: CellApresentable {
    
    var cellNib : UINib? {
        return UINib(nibName: "FreelaDetailTableViewCell", bundle: nil)
    }
    
    var cellIndentifier : String {
        return "FreelaDetailListCellIndentifier"
    }
    
    var hasDetail : Bool {
        return false
    }
    
    func fetchDetail(completion: ((UIViewController) -> Void)?) {

    }
}
