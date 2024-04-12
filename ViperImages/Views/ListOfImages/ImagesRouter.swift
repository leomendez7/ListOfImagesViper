//
//  ImagesRouter.swift
//  ViperImages
//
//  Created by Leonardo Mendez on 10/04/24.
//  
//

import Foundation
import UIKit

class ImagesRouter: PresenterToRouterImagesProtocol {
    
    // MARK: Static methods
    static func createImagesListViewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "Images", bundle: nil)
        let navigationController = storyboard.instantiateViewController(withIdentifier: "Images") as! UINavigationController
        let viewController = navigationController.topViewController as! ImagesViewController
        let presenter: ViewToPresenterImagesProtocol & InteractorToPresenterImagesProtocol = ImagesPresenter()
        viewController.presenter = presenter
        viewController.presenter?.router = ImagesRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ImagesInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        return viewController
    }
    
}
