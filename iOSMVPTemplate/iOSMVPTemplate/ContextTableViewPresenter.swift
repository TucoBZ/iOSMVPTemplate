//
//  FrellaPresenter.swift
//  Cthullu
//
//  Created by Túlio Bazan da Silva on 11/04/17.
//  Copyright (c) 2017 Guilherme Machado. All rights reserved.
//

import UIKit


protocol ContextTableViewViewPresenter {
    func update()
}

class ContextTableViewPresenter:  NSObject,ContextTableViewViewPresenter{
    weak var view: ContextTableViewView?
    
  
    // MARK: Initializer logic
    required init(view: ContextTableViewView) {
        self.view = view
        super.init()
    }
  
    
    // MARK: Presentation logic
  
    func update() {
    // NOTE: Format the response and pass the result back to the View Controller
    }
}


