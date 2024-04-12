//
//  ImageListView.swift
//  ViperImages
//
//  Created by Leonardo Mendez on 10/04/24.
//

import UIKit

class ImageListViewController: UIViewController {
    
    var presenter: ImageListPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            await presenter?.onViewAppear()
        }
    }
    
}

extension ImageListViewController: ImageListUI {
    
    func update(images: [ImageElement]) {
        print(images)
    }
    
}
