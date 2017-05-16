//
//  jobIconView.swift
//  Cthullu
//
//  Created by Túlio Bazan da Silva on 09/05/17.
//  Copyright (c) 2017 Tulio Bazan. All rights reserved.
//

import UIKit

@IBDesignable
class jobIconView: UIView {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var jobLabel: UILabel!
    
    // Our custom view from the XIB file
    var view: UIView!

    /**
     Initialiser method
     */
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    /**
     Initialiser method
     */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    /**
     Sets up the view by loading it from the xib file and setting its frame
     */
    func setupView() {
        view = loadViewFromXibFile()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }

    /**
     Loads a view instance from the xib file
     - returns: loaded view
     */
    func loadViewFromXibFile() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "jobIconView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
}
