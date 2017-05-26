//
//  LoginPresenter.swift
//  Cthullu
//
//  Created by Túlio Bazan da Silva on 24/05/17.
//  Copyright (c) 2017 Tulio Bazan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

protocol LoginViewPresenter{
    func setup()
    func login()
    func register()
}

class LoginPresenter:  NSObject,LoginViewPresenter{
    weak var view: LoginView?
    
  
    // MARK: Initializer logic
    required init(view: LoginView) {
        self.view = view
        super.init()
    }
  
    
    // MARK: Presentation logic
  
    func setup() {
    
        FIRAuth.auth()?.addStateDidChangeListener() { auth, user in
            if let user = user {
                Factory.instance.getFreelancer(completion: { freelancers in
                    
                    for freelancer in freelancers {
                        if freelancer.id == user.uid {
                            Factory.instance.loggedFreelancer = freelancer
                            self.view?.result(login: true)
                        }
                    }
                    
                    self.view?.result(login: false)
                })
            }
        }
    }
    
    
    func login() {
        
        guard let email = view?.email, let password = view?.password else {
            view?.result(login: false)
            return
        }
        
        login(email: email, password: password)
    }
    
    func login(email: String, password: String) {
         FIRAuth.auth()?.signIn(withEmail: email, password: password)
    }
    
    func register() {
        let alert = UIAlertController(title: "Register",
                                      message: "Register a new user",
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            // 1
            guard let textFieldName = alert.textFields?[0],
                let name = textFieldName.text,
                let textFieldPhone = alert.textFields?[1],
                let phone = textFieldPhone.text,
                let textFieldEmail = alert.textFields?[2],
                let email = textFieldEmail.text,
                let textFieldPassword = alert.textFields?[3],
                let password = textFieldPassword.text else { return }
            
            FIRAuth.auth()?.createUser(withEmail: email, password: password) { user, error in
                if let user = user {
                    
                    let freelancer = Freelancer.init(id: user.uid, createdDate: nil, name: name, email: email, phone: phone)
                    
                    let itemRef = FIRDatabase.database().reference(withPath: "Freelancer").child(freelancer.id)
                    
                    itemRef.setValue(freelancer.toAnyObject())
                
                    self.login(email: email, password: password)
                }
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .default)
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Name"
        })
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Phone"
        })
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Email"
        })
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Password"
            textField.isSecureTextEntry = true
        })
       
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        if let view = view as? LoginViewController {
            view.present(alert, animated: true, completion: nil)
        }
    }
}


