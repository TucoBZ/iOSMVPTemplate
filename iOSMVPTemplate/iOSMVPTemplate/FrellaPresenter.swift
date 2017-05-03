//
//  FrellaPresenter.swift
//  Cthullu
//
//  Created by Túlio Bazan da Silva on 19/04/17.
//  Copyright © 2017 Tulio Bazan. All rights reserved.
//

import Foundation

class FrellaPresenter: ContextTableViewPresenter {

    override func update() {
        // NOTE: Format the response and pass the result back to the View Controller
        loadFreela()
    }
    
    func loadFreela() {
        var freela1 = Freela()
        freela1.title = "Lorem ipsum dolor sit amet - 1"
        freela1.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        freela1.type = .design
        
        var freela2 = Freela()
        freela2.title = "Lorem ipsum dolor sit amet - 1"
        freela2.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        freela2.type = .tester
        
        var freela3 = Freela()
        freela3.title = "Lorem ipsum dolor sit amet - 1"
        freela3.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        freela3.type = .development
        
        var freela4 = Freela()
        freela4.title = "Lorem ipsum dolor sit amet - 1"
        freela4.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        freela4.type = .productOwner
        
        view?.updateTableView(with: [freela1, freela2, freela3, freela4])
    }
}
