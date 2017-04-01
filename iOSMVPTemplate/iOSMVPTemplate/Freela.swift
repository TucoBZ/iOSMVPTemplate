//
//  Freela.swift
//  Cthullu
//
//  Created by Túlio Bazan da Silva on 31/03/17.
//  Copyright © 2017 Guilherme Machado. All rights reserved.
//

import UIKit

struct Freela {
    var points: NSNumber?
    var pointsToExpire: Int?
    var expiredPointsSum: Int?
    var lastUpdate: Date?
    var expiredList: NSArray?
    var success: Bool?
}

struct FreelaList: CellApresentable {
    
    
    
    
    var cellNib : UINib? {
        return R.nib.freelaTableViewCell()
    }
    
    var cellIndentifier : String {
        return "FreelaListCellIndentifier"
    }
    
    func fetchDetail(completion: ((UIViewController) -> Void)?) {
    
    }
}
