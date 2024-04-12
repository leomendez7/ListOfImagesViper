//
//  ImageDetailsPresenter.swift
//  ViperImages
//
//  Created by Leonardo Mendez on 12/04/24.
//  
//

import Foundation

class ImageDetailsPresenter: ViewToPresenterImageDetailsProtocol {

    // MARK: Properties
    var view: PresenterToViewImageDetailsProtocol?
    var interactor: PresenterToInteractorImageDetailsProtocol?
    var router: PresenterToRouterImageDetailsProtocol?
}

extension ImageDetailsPresenter: InteractorToPresenterImageDetailsProtocol {
    
    public func deleteImage(imageId: String) {
        interactor?.deleteImage(imageId: imageId, completion: { response, error in
            self.view?.update(response: response)
        })
    }
    
}
