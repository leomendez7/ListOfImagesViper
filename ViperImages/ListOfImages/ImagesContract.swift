//
//  ImagesContract.swift
//  ViperImages
//
//  Created by Leonardo Mendez on 10/04/24.
//  
//

import Foundation

// MARK: View Output (Presenter -> View)
protocol PresenterToViewImagesProtocol {
    func update(images: [ImageElement])
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterImagesProtocol {
    var view: PresenterToViewImagesProtocol? { get set }
    var interactor: PresenterToInteractorImagesProtocol? { get set }
    var router: PresenterToRouterImagesProtocol? { get set }
    func onViewAppear()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorImagesProtocol {
    var presenter: InteractorToPresenterImagesProtocol? { get set }
    func fetchImages(completion: @escaping ([ImageElement], Error?) -> Void)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterImagesProtocol {
    func onViewAppear()
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterImagesProtocol {
    
}
