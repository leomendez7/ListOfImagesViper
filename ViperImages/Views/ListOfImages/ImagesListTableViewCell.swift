//
//  ImagesListTableViewCell.swift
//  ViperImages
//
//  Created by Leonardo Mendez on 10/04/24.
//

import UIKit
import Kingfisher

class ImagesListTableViewCell: UITableViewCell {

    @IBOutlet weak var imageElementImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backgroundCellView: UIView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureImage(image: ImageElement?) {
        let url = URL(string: image?.thumbnailURL ?? "")
        titleLabel.text = image?.title
        imageElementImageView.kf.setImage(with: url)
        imageElementImageView.layer.cornerRadius = 16
        backgroundCellView.layer.cornerRadius = 16
    }

}
