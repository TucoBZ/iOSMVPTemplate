//
//  FrellaPresenter.swift
//  Cthullu
//
//  Created by Túlio Bazan da Silva on 19/04/17.
//  Copyright © 2017 Tulio Bazan. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class FrellaPresenter: ContextTableViewPresenter {

    var textFieldType: UITextField?
    
    override func logout() {
        try! FIRAuth.auth()!.signOut()
        if let view = view as? ContextTableViewController {
            let vc = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "loginViewController") as UIViewController
            Factory.instance.loggedFreelancer = nil
            
            view.present(vc, animated: false, completion: nil)
           
        }
        
    }
    
    override func update() {
        // NOTE: Format the response and pass the result back to the View Controller
        loadFreela()
    }
    
    override func addItem() {
        let alert = UIAlertController(title: "New Freela",
                                      message: "Add a Freela",
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            // 1
            guard let textFieldTitle = alert.textFields?[0],
                let title = textFieldTitle.text,
                let textFieldDescription = alert.textFields?[1],
                let description = textFieldDescription.text,
                let textFieldType = alert.textFields?[2],
                let type = FreelaType(rawValue: textFieldType.text ?? ""),
                let freelancer = Factory.instance.loggedFreelancer else { return }
            
            
            // 2
            let item = FreelaDetail(id: nil, title: title,
                                    description: description, type: type,
                                    name: freelancer.name, email: freelancer.email, phone: freelancer.phone, createdDate: nil)
            // 3
            let itemRef = FIRDatabase.database().reference(withPath: "Freela").child(item.id ?? "")
            
            // 4
            itemRef.setValue(item.toAnyObject())
            
            self.update()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .default)
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Title"
        })
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Description"
        })
        alert.addTextField(configurationHandler: { textField in
            self.textFieldType = textField
            textField.placeholder = "Type"
            let pickerView: PickerBoard =  PickerBoard(frame: CGRect(x: 0, y: 0, width: 0, height: 250))
            pickerView.pickerComponents = FreelaType.freelaTypes
            pickerView.delegate = self
            textField.inputView = pickerView
        })
        
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        if let view = view as? ContextTableViewController {
            view.present(alert, animated: true, completion: nil)
        }
    }
    
    func loadFreela() {
        
        Factory.instance.getFreelaDetail(completion: { freelaDetails in
            var freelas : [Freela] = []
            for freelaDetail in freelaDetails {
                freelas.append(freelaDetail.freela)
            }
            
            self.view?.updateTableView(with: freelas)
        })
    }
}

extension FrellaPresenter : PickerBoardDelegate {
    func didSelect(index: Int) {
        if let field = textFieldType {
            field.text = FreelaType.freelaTypes[index]
        }
    }
}
