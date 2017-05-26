//
//  FreelancerTableViewCell.swift
//  iOSMVPTemplate
//
//  Created by Túlio Bazan da Silva on 30/03/17.
//  Copyright © 2017 Guilherme Machado. All rights reserved.
//

import UIKit

class FreelancerTableViewCell: UITableViewCell {

    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var jobTypeLabel: UILabel!
    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func configure(content: Any?) {
        if let freela = content as? FreelaDetail {
            topicLabel.text = freela.title
            descriptionLabel.text = freela.description
            jobTypeLabel.text = freela.type.description
            imageIcon.image = freela.type.icon
            contactNameLabel.text = freela.name
            phoneLabel.text = freela.phone
            emailLabel.text = freela.email
        }
    }
}

