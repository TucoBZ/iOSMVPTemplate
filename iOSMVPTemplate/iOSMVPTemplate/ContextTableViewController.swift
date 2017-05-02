//
//  ContextTableViewController.swift
//  Cthullu
//
//  Created by Túlio Bazan da Silva on 11/04/17.
//  Copyright (c) 2017 Guilherme Machado. All rights reserved.
//

import UIKit

protocol ContextTableViewView: class {
    func updateTableView(with dataSource: [CellApresentable])
}

class ContextTableViewController: GenericViewController {
    var presenter: ContextTableViewPresenter?

    @IBOutlet weak var tableView: GenericTableView!
   
    enum TableContext:Int {
        case detail
        case freela
        case freelaDetail
        
        
        func createPresenter(view: ContextTableViewView) -> ContextTableViewPresenter? {
            switch self {
            case .freela:
                return FrellaPresenter(view: view)
            default:
                return nil
            }
        }
    }
    
    // Programmatically: use the enum
    var context: TableContext = .freela {
        didSet {
            presenter = context.createPresenter(view: self)
        }
    }
    
    // IB: use the adapter
    @IBInspectable var shapeAdapter:Int {
        get {
            return self.context.rawValue
        }
        set(index) {
            self.context = TableContext(rawValue: index) ?? .freela
        }
    }
    
    // MARK: Object lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        if presenter == nil {
            presenter = context.createPresenter(view: self)
        }
    }

    // MARK: View lifecycle

    override func viewDidLoad(){
        super.viewDidLoad()
        updateView()
    }

    // MARK: Event handling

    func updateView(){
        // NOTE: Ask the Presenter to do some work
        tableView.genericView = self
        tableView.presentable = self
        presenter?.update()
    }
}


extension ContextTableViewController : ContextTableViewView {

    // MARK: Display logic

    func updateTableView(with dataSource: [CellApresentable]) {
        // NOTE: Display the result from the Presenter
        tableView.present(list: dataSource)
    }
}



