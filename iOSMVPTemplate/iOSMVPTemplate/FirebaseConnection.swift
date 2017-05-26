//
//  FirebaseConnection.swift
//  Cthullu
//
//  Created by Túlio Bazan da Silva on 16/05/17.
//  Copyright © 2017 Tulio Bazan. All rights reserved.
//

import Foundation
import Firebase


class FirebaseConnection : NSObject, FactoryConnection {
    
    func getFreelaDetail(completion: (([FreelaDetail]) -> ())?) {
    
        let ref = FIRDatabase.database().reference(withPath: "Freela")
        //let frellaRef = ref.child("Frella")
        ref.observe(.value, with: { snapshot in
            
            var freelaDetails: [FreelaDetail] = []
            
            for item in snapshot.children {
                if let firdata = item as? FIRDataSnapshot {
                    let freela = FreelaDetail(snapshot: firdata)
                    freelaDetails.append(freela)
                }
            }
            
            completion?(freelaDetails)
        })
    }
    
    func update(object: FreelaDetail, response: (() -> Void)?) {
    
    }
    
//    func getProfile() -> [Profile] {
//        return []
//    }
//    
//    func update(object: Profile, response: (() -> Void)?) {
//    
//    }
    
    func getFreelancer(completion: (([Freelancer]) -> ())?) {
        let ref = FIRDatabase.database().reference(withPath: "Freelancer")
        //let frellaRef = ref.child("Frella")
        ref.observe(.value, with: { snapshot in
            
            var freelaDetails: [Freelancer] = []
            
            for item in snapshot.children {
                if let firdata = item as? FIRDataSnapshot {
                    let freela = Freelancer(snapshot: firdata)
                    freelaDetails.append(freela)
                }
            }
            
            completion?(freelaDetails)
        })
    }
    
    func update(object: Freelancer, response: (() -> Void)?) {
    
    }
}
