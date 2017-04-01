//
//  GenericTablePresenter.swift
//  Cthullu
//
//  Created by Túlio Bazan da Silva on 30/03/17.
//  Copyright (c) 2017 Guilherme Machado. All rights reserved.
//

import UIKit
//import PromiseKit


protocol GenericTableViewPresenter{
    var numberOfObjects : Int {get}
    func object(at indexPath: IndexPath) -> CellApresentable?
    func tableView(didSelectRowAt indexPath: IndexPath)
}

class GenericTablePresenter:  NSObject,GenericTableViewPresenter{
    weak var view: GenericTableView?
    weak var presentableView: Presentable?
    
    var objects: [CellApresentable]? {
        didSet {
            if objects?.count ?? 0 > 0 {
                view?.configureTableView()
            }
        }
    }
    
    // MARK: Initializer logic
    required init(view: GenericTableView, presentableView: Presentable) {
        self.view = view
        self.presentableView = presentableView
        super.init()
    }
  
    // MARK: Presentation logic
    var numberOfObjects : Int {
        return objects?.count ?? 0
    }
    
    func tableView(didSelectRowAt indexPath: IndexPath) {
        guard let content = objects?[indexPath.row] else { return }
        
        content.fetchDetail(completion: showDetail(_:))
    }
    
    private func showDetail(_ controller: UIViewController) {
        presentableView?.push(viewController: controller, animated: true)
    }
    
    
    func object(at indexPath: IndexPath) -> CellApresentable? {
        return objects?[indexPath.row]
    }
}

