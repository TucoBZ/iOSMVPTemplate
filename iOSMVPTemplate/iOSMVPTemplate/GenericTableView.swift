//
//  GenericTableViewController.swift
//  Cthullu
//
//  Created by Túlio Bazan da Silva on 30/03/17.
//  Copyright (c) 2017 Guilherme Machado. All rights reserved.
//

import UIKit

protocol GenericTableViewView: GenericView {
    func updateTableView()
    func updateLayout()
    func configureTableView()
}

class GenericTableView: UITableView {
    
    var presenter: GenericTableViewPresenter?
    var presentable: Presentable?
    var genericView: GenericView?
    
    func present(list: [CellApresentable]) {
        presenter?.set(list: list)
    }
    
    //@IBOutlet weak var tableView: UITableView!
    
    // MARK: Object lifecycle
  
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if presenter == nil {
            presenter = GenericTablePresenter.init(view: self, presentableView: self)
        }
    }

  
    // MARK: Event handling
    func configureTableView(){
        
        estimatedRowHeight = 80
        rowHeight = UITableViewAutomaticDimension
        backgroundView = UIView()
        backgroundView?.backgroundColor = UIColor.white
        tableFooterView = UIView()
        
        if let object = presenter?.object(at: IndexPath(row: 1, section: 0)) {
            register(object.cellNib, forCellReuseIdentifier: object.cellIndentifier)
        }
    }
}


extension GenericTableView : GenericTableViewView {
    
    // MARK: Display logic

    func updateTableView() {
        reloadData()
    }
    
    func updateLayout() {
        beginUpdates()
        endUpdates()
    }
}


extension GenericTableView : Presentable {
    
    func presentModal(viewController: UIViewController, animated: Bool, completion:  (() -> Void)?) {
        presentable?.presentModal(viewController: viewController, animated: animated, completion: completion)
    }
    
    func push(viewController: UIViewController, animated: Bool) {
        presentable?.push(viewController: viewController, animated: animated)
    }
    
    func handle(error: Error, retrier: (() -> Void)?) {
        presentable?.handle(error: error, retrier: retrier)
    }
    
    func present(url: URL) {
        presentable?.present(url: url)
    }
}

extension GenericTableView : GenericView {
    
    func loading(enable: Bool) {
        genericView?.loading(enable: enable)
    }
    
    
    func display(textField: UITextField, error: String) {
        genericView?.display(textField: textField, error: error)
    }
}
