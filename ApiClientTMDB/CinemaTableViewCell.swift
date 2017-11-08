//
//  CinemaTableViewCell.swift
//  ApiClientTMDB
//
//  Created by Nikolay on 08.11.17.
//  Copyright © 2017 KODE. All rights reserved.
//

import UIKit
import Kingfisher

class CinemaTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var cinemaTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    static let id = "CinemaTableViewCell"
    
    
    func loadImage(url: String){
        posterImage.kf.setImage(with: URL(string: url))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
