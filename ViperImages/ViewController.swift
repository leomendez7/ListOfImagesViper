//
//  ViewController.swift
//  ViperImages
//
//  Created by Leonardo Mendez on 10/04/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presentImagesController()
    }

    func presentImagesController() {
        let vc = ImagesRouter.createImagesListViewController()
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: false)
    }
    
}

