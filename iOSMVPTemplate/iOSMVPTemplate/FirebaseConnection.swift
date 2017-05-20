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
    
    func getFreelaDetail() -> [FreelaDetail] {
        let ref = FIRDatabase.database().reference(withPath: "Freela")
        //let frellaRef = ref.child("Frella")
        ref.observe(.value, with: { snapshot in
                print(snapshot.value)
        })
        return []
    }
    
    func update(object: FreelaDetail, response: (() -> Void)?) {
    
    }
    
    func getProfile() -> [Profile] {
        return []
    }
    
    func update(object: Profile, response: (() -> Void)?) {
    
    }
    
    func getFreelancer() -> [Freelancer] {
        return []
    }
    
    func update(object: Freelancer, response: (() -> Void)?) {
    
    }
}