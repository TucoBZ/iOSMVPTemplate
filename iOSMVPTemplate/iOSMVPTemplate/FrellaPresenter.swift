//
//  FrellaPresenter.swift
//  Cthullu
//
//  Created by Túlio Bazan da Silva on 11/04/17.
//  Copyright (c) 2017 Guilherme Machado. All rights reserved.
//

import UIKit


protocol FrellaViewPresenter{
    func doSomething()
}

class FrellaPresenter:  NSObject,FrellaViewPresenter{
    weak var view: FrellaView?
    
  
    // MARK: Initializer logic
    required init(view: FrellaView) {
        self.view = view
        super.init()
    }
  
    
    // MARK: Presentation logic
  
    func doSomething(){
    // NOTE: Format the response and pass the result back to the View Controller
        view?.displaySomething(object: nil)
    }
}


