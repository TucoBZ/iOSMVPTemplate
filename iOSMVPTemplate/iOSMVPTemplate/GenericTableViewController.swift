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
    func register(nib: UINib?, identifier: String)
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
        tableView?.dataSource = presenter?.tableViewDataSource
        
        tableView?.estimatedRowHeight = 80
        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.backgroundView = UIView()
        tableView?.backgroundView?.backgroundColor = UIColor.white
        tableView?.tableFooterView = UIView()
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
    
    func register(nib: UINib?, identifier: String) {
        tableView?.register(nib, forCellReuseIdentifier: identifier)
    }
}

extension GenericTableViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.tableView(didSelectRowAt: indexPath)
    }
}

