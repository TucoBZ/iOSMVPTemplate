//
//  FrellaPresenter.swift
//  Cthullu
//
//  Created by Túlio Bazan da Silva on 19/04/17.
//  Copyright © 2017 Tulio Bazan. All rights reserved.
//

import UIKit
import Firebase

class FrellaPresenter: ContextTableViewPresenter {

    var textFieldType: UITextField?
    
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
                let type = FreelaType(rawValue: textFieldType.text ?? "") else { return }
            
            // 2
            let item = FreelaDetail(id: nil, title: title, description: description, type: type, contact: nil, createdDate: nil)
            // 3
            let itemRef = FIRDatabase.database().reference(withPath: "Freela").child("\(item.id?.intValue)")
            
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
        
        
        
//
//        var freela1 = Freela()
//        freela1.title = "Lorem ipsum dolor sit amet - 1"
//        freela1.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
//        freela1.type = .design
//        
//        var freela2 = Freela()
//        freela2.title = "Lorem ipsum dolor sit amet - 1"
//        freela2.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
//        freela2.type = .tester
//        
//        var freela3 = Freela()
//        freela3.title = "Lorem ipsum dolor sit amet - 1"
//        freela3.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
//        freela3.type = .development
//        
//        var freela4 = Freela()
//        freela4.title = "Lorem ipsum dolor sit amet - 1"
//        freela4.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
//        freela4.type = .productOwner
        
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
