//
//  GenericViewController.swift
//  iOSMVPTemplate
//
//  Created by Guilherme Machado on 31/01/17.
//  Copyright © 2017 Guilherme Machado. All rights reserved.
//

import UIKit


protocol Presentable: class {
    func presentModal(viewController: UIViewController, animated: Bool, completion:  (() -> Void)?)
    func push(viewController: UIViewController, animated: Bool)
    func handle(error: Error, retrier: (() -> Void)?)
    func present(url: URL)
}

protocol GenericView : class {
    func loading(enable: Bool)
    func display(textField: UITextField, error: String)
}

class GenericViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension GenericViewController : Presentable {
    
    func presentModal(viewController: UIViewController, animated: Bool, completion:  (() -> Void)?) {
        navigationController?.present(viewController, animated: animated, completion: completion)
    }
    
    func push(viewController: UIViewController, animated: Bool) {
        navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func handle(error: Error, retrier: (() -> Void)?) {
//        switch error {
//        case SomeError:
//             Trate esse erro
//        default:
//              Tratamento default
//        }
    }
    
    func present(url: URL) {
        UIApplication.shared.openURL(url)
    }
    
    func presentAlert(title: String, message: String) {
        let alertOkButtonText = "Ok"
        
        if #available(iOS 8, *) {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let actionOk = UIAlertAction(title: alertOkButtonText,
                                         style: .default,
                                         handler: nil)
            alertController.addAction(actionOk)
        }
        else {
            let alertView = UIAlertView(title: title, message: message, delegate: nil, cancelButtonTitle: nil, otherButtonTitles: alertOkButtonText)
            alertView.show()
        }
    }
}

extension GenericViewController : GenericView {
    
    func loading(enable: Bool) {
        if enable {
            Loading.show(from: self)
        } else {
            Loading.hide()
        }
    }
    
    
    func display(textField: UITextField, error: String) {
    
    }
}
