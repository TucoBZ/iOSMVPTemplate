//
//  Freela.swift
//  Cthullu
//
//  Created by Túlio Bazan da Silva on 31/03/17.
//  Copyright © 2017 Guilherme Machado. All rights reserved.
//

import UIKit


enum FreelaType {
    case development
    case design
    case productOwner
    case tester
    case projectManager
}

struct Freela {
    var id: NSNumber?
    var title: String?
    var description: String?
    var type: [FreelaType] = []
    var createdDate: Date = Date()
}

extension Freela: CellApresentable {
    
    var cellNib : UINib? {
        return UINib(nibName: "FreelaTableViewCell", bundle: nil)
    }
    
    var cellIndentifier : String {
        return "FreelaListCellIndentifier"
    }
    
    func fetchDetail(completion: ((UIViewController) -> Void)?) {
    
    }
}
