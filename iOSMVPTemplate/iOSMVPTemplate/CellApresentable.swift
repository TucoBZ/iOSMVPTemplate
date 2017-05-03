//
//  CellApresentable.swift
//  Cthullu
//
//  Created by Túlio Bazan da Silva on 30/03/17.
//  Copyright © 2017 Guilherme Machado. All rights reserved.
//

import UIKit

protocol CellApresentable {
    var cellNib : UINib? {get}
    var cellIndentifier : String {get}
    var hasDetail : Bool {get}
    func fetchDetail(completion: ((UIViewController) -> Void)?)
}

extension UITableViewCell {
    func configure(content: Any?) {}
}
