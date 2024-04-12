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
        title = "Images List"
        UINavigationBar.appearance().prefersLargeTitles = true
        presenter?.onViewAppear()
        NetworkMonitor.shared.startMonitoring()
        NotificationCenter.default.addObserver(self, selector: #selector(networkStatusDidChange), name: .networkStatusDidChange, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @objc func networkStatusDidChange() {
        if isConnectedToNetwork() {
            if Default.image != nil {
                presenter?.deleteImage(imageId: "\(Default.image?.id ?? 0)")
                Default.destroy()
            }
        } 
    }
    
}

extension ImagesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.images.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 116
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ImagesListTableViewCell = tableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath
        ) as? ImagesListTableViewCell else { return ImagesListTableViewCell() }
        cell.configureImage(image: self.images[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = ImageDetailsRouter.createImageDetailsViewController()
        viewController.image = images[indexPath.row]
        viewController.delegate = self
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension ImagesViewController: PresenterToViewImagesProtocol {
    
    func updateDelete(response: Bool) {
        print("Delete imagen offline")
        if response {
            presenter?.onViewAppear()
        } else {
            self.showAlert(title: "Error!", message: "An error has occurred.")
        }
    }
    
    func update(images: [ImageElement]) {
        DispatchQueue.main.async {
            self.images.removeAll()
            self.images = images
            self.tableView?.reloadData()
        }
    }

}

extension ImagesViewController: deleteImageDelegate {
    
    func reloadImages(reload: Bool) {
        if reload {
            print("reload")
            presenter?.onViewAppear()
        }
    }
    
}
