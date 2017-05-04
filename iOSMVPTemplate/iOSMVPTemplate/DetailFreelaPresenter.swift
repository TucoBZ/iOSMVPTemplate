//
//  DetailFreelaPresenter.swift
//  Cthullu
//
//  Created by Túlio Bazan da Silva on 02/05/17.
//  Copyright © 2017 Tulio Bazan. All rights reserved.
//

import Foundation

class DetailFreelaPresenter: ContextTableViewPresenter {
    
    var freela: FreelaDetail?
    
    override func update() {
        // NOTE: Format the response and pass the result back to the View Controller
        if let freela = freela {
            view?.updateTableView(with: [freela])
        }
    }
}
