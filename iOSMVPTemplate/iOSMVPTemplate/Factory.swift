//
//  Factory.swift
//  Cthullu
//
//  Created by Túlio Bazan da Silva on 16/05/17.
//  Copyright © 2017 Tulio Bazan. All rights reserved.
//

import Foundation

protocol FactoryConnection {
    func getFreelaDetail(completion: (([FreelaDetail]) -> ())?)
    func update(object: FreelaDetail, response: (() -> Void)?)

//    func getProfile() -> [Profile]
//    func update(object: Profile, response: (() -> Void)?)
    
    func getFreelancer(completion: (([Freelancer]) -> ())?)
    func update(object: Freelancer, response: (() -> Void)?)
}

public class Factory : NSObject {
    static let instance = Factory()
    
    var loggedFreelancer: Freelancer?
    
    fileprivate let connection : FactoryConnection = FirebaseConnection()

}

extension Factory: FactoryConnection {

    func getFreelaDetail(completion: (([FreelaDetail]) -> ())?){
        return connection.getFreelaDetail(completion: completion)
    }
    
    func update(object: FreelaDetail, response: (() -> Void)?) {
        connection.update(object: object, response: response)
    }
    
//    func getProfile() -> [Profile] {
//        return connection.getProfile()
//    }
//    
//    func update(object: Profile, response: (() -> Void)?) {
//        connection.update(object: object, response: response)
//    }
    
     func getFreelancer(completion: (([Freelancer]) -> ())?) {
        return connection.getFreelancer(completion: completion)
    }
    
    func update(object: Freelancer, response: (() -> Void)?) {
        connection.update(object: object, response: response)
    }
}
