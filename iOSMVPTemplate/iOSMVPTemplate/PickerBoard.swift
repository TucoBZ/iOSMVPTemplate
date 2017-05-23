//
//  PickerBoard.swift
//  GenericViews
//
//  Created by Túlio Bazan da Silva on 16/01/17.
//  Copyright (c) 2017 Livelo. All rights reserved.
//

import UIKit

protocol PickerBoardDelegate {
    func didSelect(index: Int)
}


@IBDesignable
class PickerBoard: UIView {
    
    // Our custom view from the XIB file
    var fontSize : CGFloat = 16.0
    var view: UIView!
    var pickerComponents: [String] = [] {
        didSet {
            if pickerComponents.count > 0 {
                delegate?.didSelect(index: 0)
            }
        }
    }
    
    var delegate: PickerBoardDelegate?

    var selectedIndex: Int = 0
    
    @IBOutlet weak var pickerView: UIPickerView!
    
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
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.selectRow(0, inComponent: 0, animated: false)
        
    }
    
    /**
     Loads a view instance from the xib file
     - returns: loaded view
     */
    func loadViewFromXibFile() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "PickerBoard", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    func update(row: Int) {
        delegate?.didSelect(index: row)
    }
}

extension PickerBoard : UIPickerViewDataSource {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerComponents.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 46.0
    }
}

extension PickerBoard : UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label = view as? UILabel
        if label == nil {
            label = UILabel()
        }
        
        let text = pickerComponents[row]
        label?.numberOfLines = 0
        label?.text =  text
        label?.textAlignment = .center
        label?.adjustsFontSizeToFitWidth = true
        return label!
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        update(row: row)
        selectedIndex = row
    }
}
