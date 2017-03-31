//
//  FreelaTableViewCell.swift
//  iOSMVPTemplate
//
//  Created by Túlio Bazan da Silva on 30/03/17.
//  Copyright © 2017 Guilherme Machado. All rights reserved.
//

import UIKit

class FreelaTableViewCell: UITableViewCell {

    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var subTopicLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func configure(content: Any?) {
        print(content)
    }
}

