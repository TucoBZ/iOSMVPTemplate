//
//  FreelaDetail.swift
//  Cthullu
//
//  Created by Túlio Bazan da Silva on 02/05/17.
//  Copyright © 2017 Tulio Bazan. All rights reserved.
//

import UIKit

struct FreelaDetail {
    var id: NSNumber?
    var title: String?
    var description: String?
    var type: FreelaType = .development
    var contact: Profile?
    var createdDate: Date = Date()
    
    static func mock(freela: Freela) -> FreelaDetail{
        return FreelaDetail(id: freela.id,
                            title: freela.title,
                            description: freela.description,
                            type: freela.type,
                            contact: Profile.mock(),
                            createdDate: freela.createdDate)
    }
}

extension FreelaDetail: CellApresentable {
    
    var cellNib : UINib? {
        return UINib(nibName: "FreelaDetailTableViewCell", bundle: nil)
    }
    
    var cellIndentifier : String {
        return "FreelaDetailListCellIndentifier"
    }
    
    var hasDetail : Bool {
        return false
    }
    
    func fetchDetail(completion: ((UIViewController) -> Void)?) {

    }
}
