//
//  ImagesViewController.swift
//  ViperImages
//
//  Created by Leonardo Mendez on 10/04/24.
//  
//

import UIKit

class ImagesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView?
    
    // MARK: - Properties
    var presenter: ViewToPresenterImagesProtocol?
    var images: [ImageElement] = []
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.onViewAppear()
    }
    
}

extension ImagesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.images.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ImagesListTableViewCell = tableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath
        ) as? ImagesListTableViewCell else { return ImagesListTableViewCell() }
        cell.configureImage(image: self.images[indexPath.row])
        return cell
    }
    
}

extension ImagesViewController: PresenterToViewImagesProtocol {
    
    func update(images: [ImageElement]) {
        DispatchQueue.main.async {
            self.images = images
            self.tableView?.reloadData()
        }
    }

}
