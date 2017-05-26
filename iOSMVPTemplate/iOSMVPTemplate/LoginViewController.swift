//
//  LoginViewController.swift
//  Cthullu
//
//  Created by Túlio Bazan da Silva on 24/05/17.
//  Copyright (c) 2017 Tulio Bazan. All rights reserved.
//

import UIKit

protocol LoginView: class {
    var email : String? {get}
    var password : String? {get}
    
    func result(login: Bool)
    func result(register: Bool)
}

class LoginViewController: GenericViewController {
    var presenter: LoginViewPresenter?

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    // MARK: Object lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        if presenter == nil {
            presenter = LoginPresenter.init(view: self)
        }
    }

    // MARK: View lifecycle

    override func viewDidLoad(){
        super.viewDidLoad()
        presenter?.setup()
    }

    // MARK: Event handling
    
    @IBAction func login(_ sender: UIButton) {
       presenter?.login()
    }
    
    @IBAction func register(_ sender: UIButton) {
        presenter?.register()
    }
}


extension LoginViewController : LoginView {

    // MARK: Display logic

    var email : String? {
        get{
            return  emailTextField?.text
        }
    }
    
    var password : String? {
        get {
            return passwordTextField?.text
        }
    }
    
    func result(login: Bool) {
        if login {
            self.performSegue(withIdentifier: "loginSegue", sender: nil)
        } else {
            self.presentAlert(title: "Login", message: "Verifique seus dados e tente novamente")
        }
    }
    
    func result(register: Bool) {
       
    }
}
