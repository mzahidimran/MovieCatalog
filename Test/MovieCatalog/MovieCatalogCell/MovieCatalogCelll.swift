//
//  MovieCatalog.swift
//  Test
//
//  Created by Muhammad Zahid Imran on 4/22/19.
//  Copyright © 2019 24. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class MovieCatalogCell: UITableViewCell {
    
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var movie: Movie! {
        didSet {
            self.titleLabel.text = movie.title
            self.bannerImageView.af_setImage(withURL: URL(string: AppConstants.shared.IMAGE_REPO_BASE_URL + movie.backdrop_path)!, placeholderImage: #imageLiteral(resourceName: "placeholder"))
        }
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.titleLabel.text = ""
        self.bannerImageView.image = #imageLiteral(resourceName: "placeholder")
    }
    
    
}
