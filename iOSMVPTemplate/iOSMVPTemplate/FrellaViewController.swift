//
//  FrellaViewController.swift
//  Cthullu
//
//  Created by Túlio Bazan da Silva on 11/04/17.
//  Copyright (c) 2017 Guilherme Machado. All rights reserved.
//

import UIKit

protocol FrellaView: class {
  func displaySomething(object: AnyObject?)
}

class FrellaViewController: GenericViewController {
    var presenter: FrellaViewPresenter?

    @IBOutlet weak var tableView: GenericTableView!
   
    // MARK: Object lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        if presenter == nil {
            presenter = FrellaPresenter.init(view: self)
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
        
        var freela1 = Freela()
        freela1.title = "Lorem ipsum dolor sit amet - 1"
        freela1.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        
        tableView.present(list: [freela1, freela1])
        presenter?.doSomething()
    }
}


extension FrellaViewController : FrellaView {

    // MARK: Display logic

    func displaySomething(object: AnyObject?) {
        // NOTE: Display the result from the Presenter
    }
}



