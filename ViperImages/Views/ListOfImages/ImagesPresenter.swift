//
//  ImagesPresenter.swift
//  ViperImages
//
//  Created by Leonardo Mendez on 10/04/24.
//  
//

import Foundation

class ImagesPresenter: ViewToPresenterImagesProtocol {
    
    // MARK: Properties
    var view: PresenterToViewImagesProtocol?
    var interactor: PresenterToInteractorImagesProtocol?
    var router: PresenterToRouterImagesProtocol?
    
}

extension ImagesPresenter: InteractorToPresenterImagesProtocol {
    
    public func onViewAppear() {
        interactor?.fetchImages { images, error in
            self.view?.update(images: images)
        }
    }
    
    public func deleteImage(imageId: String) {
        interactor?.deleteImage(imageId: imageId, completion: { response, error in
            self.view?.updateDelete(response: response)
        })
    }
    
}
