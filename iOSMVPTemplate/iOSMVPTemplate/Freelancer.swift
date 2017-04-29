//
//  Freelancer.swift
//  Cthullu
//
//  Created by Túlio Bazan da Silva on 25/04/17.
//  Copyright © 2017 Guilherme Machado. All rights reserved.
//

import UIKit


struct Freelancer {
    var id: NSNumber?
    var person: Profile?
    var description: String?
    var technicalSkills: [FreelaType] = []
    var createdDate: Date = Date()
}

extension Freelancer: CellApresentable {
    
    var cellNib : UINib? {
        return UINib(nibName: "FreelaTableViewCell", bundle: nil)
    }
    
    var cellIndentifier : String {
        return "FreelaListCellIndentifier"
    }
    
    func fetchDetail(completion: ((UIViewController) -> Void)?) {
        
    }
}
