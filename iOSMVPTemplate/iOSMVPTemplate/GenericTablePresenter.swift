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
    var tableViewDataSource : UITableViewDataSource {get}
    
    func tableView(didSelectRowAt indexPath: IndexPath)
}

class GenericTablePresenter:  NSObject,GenericTableViewPresenter{
    weak var view: GenericTableView?
    weak var presentableView: Presentable?
    
    var objects: [CellApresentable]? {
        didSet {
            guard let someObject = objects?.first else { return }
            view?.register(nib: someObject.cellNib, identifier: someObject.cellIndentifier)
        }
    }
    
    // MARK: Initializer logic
    required init(view: GenericTableView, presentableView: Presentable) {
        self.view = view
        self.presentableView = presentableView
        super.init()
    }
  
    
    // MARK: Presentation logic
    var tableViewDataSource : UITableViewDataSource { return self }
    
    func tableView(didSelectRowAt indexPath: IndexPath) {
        guard let content = objects?[indexPath.row] else { return }
        
        content.fetchDetail(completion: showDetail(_:))
    }
    
    private func showDetail(_ controller: UIViewController) {
        presentableView?.push(viewController: controller, animated: true)
    }
    
}

extension GenericTablePresenter : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects?.count ?? 0
    }
   
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let content = objects?[indexPath.row] else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: content.cellIndentifier, for: indexPath)
        
        cell.configure(content: content)
        
        return cell
    }
}
