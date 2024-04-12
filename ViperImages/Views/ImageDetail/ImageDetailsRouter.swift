//
//  ImageDetailsRouter.swift
//  ViperImages
//
//  Created by Leonardo Mendez on 12/04/24.
//  
//

import Foundation
import UIKit

class ImageDetailsRouter: PresenterToRouterImageDetailsProtocol {
    
    // MARK: Static methods
    static func createImageDetailsViewController() -> ImageDetailsViewController {
        let storyboard = UIStoryboard(name: "ImageDetails", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ImageDetails") as! ImageDetailsViewController
        //let viewController = ImageDetailsViewController()
        let presenter: ViewToPresenterImageDetailsProtocol & InteractorToPresenterImageDetailsProtocol = ImageDetailsPresenter()
        viewController.presenter = presenter
        viewController.presenter?.router = ImageDetailsRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ImageDetailsInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        return viewController
    }
    
}
