//
//  ImageDetailsViewController.swift
//  ViperImages
//
//  Created by Leonardo Mendez on 12/04/24.
//  
//

import UIKit
import Kingfisher

protocol deleteImageDelegate {
    func reloadImages(reload: Bool)
}

class ImageDetailsViewController: UIViewController {
    
    // MARK: - Properties
    var presenter: ViewToPresenterImageDetailsProtocol?
    var image: ImageElement?
    var delegate: deleteImageDelegate?
    
    @IBOutlet weak var imageElementImageView: UIImageView!
    @IBOutlet weak var imageTitleLabel: UILabel!
    @IBOutlet weak var ImageUrlLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Image Details"
        UINavigationBar.appearance().prefersLargeTitles = true
        configuraImage()
    }
    
    func configuraImage() {
        guard let image = self.image else { return }
        guard let url = URL(string: image.url) else { return }
        self.imageElementImageView.kf.setImage(with: url)
        self.imageTitleLabel.text = image.title
        self.ImageUrlLabel.text = image.url
        imageElementImageView.layer.cornerRadius = 16
        deleteButton.layer.cornerRadius = 16
        deleteButton.layer.borderWidth = 2
        deleteButton.layer.borderColor = UIColor.red.cgColor
    }

    @IBAction func deleteImage(_ sender: Any) {
        guard let image = self.image else { return }
        if Reachability.shared.isConnectedToNetwork() {
            presenter?.deleteImage(imageId: "\(image.id)")
        } else {
            Default.save(image: image)
            self.showAlert(title: "Error!", message: "No Internet connect")
        }
    }
    
}

extension ImageDetailsViewController: PresenterToViewImageDetailsProtocol{
    
    func update(response: Bool) {
        delegate?.reloadImages(reload: response)
        if response {
            self.navigationController?.popViewController(animated: true)
        } else {
            self.showAlert(title: "Error!", message: "No Internet connect")
        }
    }
    
}
