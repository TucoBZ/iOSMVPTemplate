//
//  Freela.swift
//  Cthullu
//
//  Created by Túlio Bazan da Silva on 31/03/17.
//  Copyright © 2017 Guilherme Machado. All rights reserved.
//

import UIKit


enum FreelaType {
    case development
    case design
    case productOwner
    case tester
    case projectManager
    
    var icon : UIImage? {
        get {
            switch self {
            case .development:
                return UIImage(named: "ic_computer")
            case .design:
                return UIImage(named: "ic_format_paint")
            case .productOwner:
                return UIImage(named: "ic_description")
            case .tester:
                return UIImage(named: "ic_bug_report")
            case .projectManager:
                return UIImage(named: "ic_developer_board")
            }
        }
    }
    
    var description : String {
        get {
            switch self {
            case .development:
                return "development"
            case .design:
                return "design"
            case .productOwner:
                return "product owner"
            case .tester:
                return "tester"
            case .projectManager:
                return "project manager"
            }
        }
    }
}

struct Freela {
    var id: NSNumber?
    var title: String?
    var description: String?
    var type: FreelaType = .development
    var createdDate: Date = Date()
}

extension Freela: CellApresentable {
    
    var cellNib : UINib? {
        return UINib(nibName: "FreelaTableViewCell", bundle: nil)
    }
    
    var cellIndentifier : String {
        return "FreelaListCellIndentifier"
    }
    
    var hasDetail : Bool {
        return true
    }
    
    func fetchDetail(completion: ((UIViewController) -> Void)?) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyboard.instantiateViewController(withIdentifier :"detailTableViewController") as? ContextTableViewController {
            viewController.context = .freelaDetail
            
            if let presenter = viewController.presenter as? DetailFreelaPresenter {
                
                
                presenter.freela = FreelaDetail.mock(freela: self)
            }
        
            completion?(viewController)
        }
    }
}
