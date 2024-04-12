//
//  ImageListRouter.swift
//  ViperImages
//
//  Created by Leonardo Mendez on 10/04/24.
//

import Foundation
import UIKit

class ImageListRouter {
    
    func showImageList(window: UIWindow?) {
        let view = ImageListViewController()
        let interactor = ImageListInteractor()
        let presenter = ImageListPresenter(imageListInteractor: interactor)
        presenter.imageListUI = view
        view.presenter = presenter
    }
    
}
