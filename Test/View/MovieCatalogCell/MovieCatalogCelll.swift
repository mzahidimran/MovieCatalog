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
import Observable

class MovieCatalogCell: UITableViewCell {
    
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    var disposal: Disposal = Disposal()
    
    var movieVM: MovieVMProtocol! {
        didSet {
            movieVM.title.observe { (newValue, oldValue) in
                self.titleLabel.text = newValue
            }.add(to: &disposal)
            
            movieVM.bannerURl.observe { (newValue, oldValue) in
                if let url = newValue {
                    self.bannerImageView.af_setImage(withURL: url, placeholderImage: #imageLiteral(resourceName: "placeholder"))
                }
                else {
                    self.bannerImageView.image = #imageLiteral(resourceName: "placeholder")
                }
            }.add(to: &disposal)
            
            
        }
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposal = Disposal()
        self.titleLabel.text = ""
        self.bannerImageView.image = #imageLiteral(resourceName: "placeholder")
    }
    
    
}
