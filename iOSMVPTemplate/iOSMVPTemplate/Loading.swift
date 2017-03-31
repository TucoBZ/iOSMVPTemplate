//
//  Loading.swift
//  Cthullu
//
//  Created by Túlio Bazan da Silva on 30/03/17.
//  Copyright © 2017 Guilherme Machado. All rights reserved.
//

import UIKit

public class Loading {
    private static let instance = Loading()
    private weak var loadingViewController: UIViewController?
    private var loadingCount = 0
    
    private init(){}
    
    public static func show(from vc: UIViewController) {
        
        if let _ = instance.loadingViewController {
            instance.loadingCount += 1
            return
        }
        
        let storyboard = UIStoryboard(name: "Loading", bundle: Bundle.main)
        let loadingViewController = storyboard.instantiateViewController(withIdentifier: "LoadingViewController")
        
        instance.loadingViewController = loadingViewController
        vc.addChildViewController(loadingViewController)
        loadingViewController.view.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: vc.view.frame.size)
        loadingViewController.view.alpha = 0
        vc.view.addSubview(loadingViewController.view)
        UIView.animate(withDuration: 0.3, animations: {
            loadingViewController.view.alpha = 1
        }, completion: { completion in
            loadingViewController.didMove(toParentViewController: vc)
        })
    }
    
    public static func hide() {
        if instance.loadingCount > 0 {
            instance.loadingCount -= 1
            return
        }
        
        instance.loadingViewController?.willMove(toParentViewController: nil)
        instance.loadingViewController?.view.removeFromSuperview()
        instance.loadingViewController?.removeFromParentViewController()
        instance.loadingViewController = nil
    }
}
