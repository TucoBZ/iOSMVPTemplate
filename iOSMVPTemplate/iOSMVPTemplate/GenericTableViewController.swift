//
//  GenericTableViewController.swift
//  Cthullu
//
//  Created by Túlio Bazan da Silva on 30/03/17.
//  Copyright (c) 2017 Guilherme Machado. All rights reserved.
//

import UIKit

protocol GenericTableView: GenericView {
    func updateTableView()
    func updateLayout()
    func configureTableView()
}

class GenericTableViewController: GenericViewController {
    
    var presenter: GenericTableViewPresenter?
    
    @IBOutlet weak var tableView: UITableView!
    
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
  
    // MARK: View lifecycle
  
    override func viewDidLoad(){
        super.viewDidLoad()
        configureTableView()
    }
  
    // MARK: Event handling
  
    func configureTableView(){
        tableView?.delegate = self
        tableView?.dataSource = self
        
        tableView?.estimatedRowHeight = 80
        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.backgroundView = UIView()
        tableView?.backgroundView?.backgroundColor = UIColor.white
        tableView?.tableFooterView = UIView()
        
        if let object = presenter?.object(at: IndexPath(row: 1, section: 0)) {
            tableView?.register(object.cellNib, forCellReuseIdentifier: object.cellIndentifier)
        }
    }
}


extension GenericTableViewController : GenericTableView {
    
    // MARK: Display logic

    func updateTableView() {
        tableView.reloadData()
    }
    
    func updateLayout() {
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}

extension GenericTableViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.tableView(didSelectRowAt: indexPath)
    }
}

extension GenericTableViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfObjects ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let content = presenter?.object(at: indexPath) else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: content.cellIndentifier, for: indexPath)
        
        cell.configure(content: content)
        
        return cell
    }
}
