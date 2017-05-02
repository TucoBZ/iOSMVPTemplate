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
        tableView.delegate = self
        tableView.dataSource = self
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


// MARK - UITableViewDelegate
extension ContextTableViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let table = tableView as? GenericTableView {
            table.presenter?.tableView(didSelectRowAt: indexPath)
        }
    }
}

// MARK - UITableViewDataSource
extension ContextTableViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let table = tableView as? GenericTableView {
            return table.presenter?.numberOfObjects ?? 0
        }
        return 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let table = tableView as? GenericTableView ,
            let content = table.presenter?.object(at: indexPath) else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: content.cellIndentifier, for: indexPath)
        
        cell.configure(content: content)
        
        return cell
    }
}



