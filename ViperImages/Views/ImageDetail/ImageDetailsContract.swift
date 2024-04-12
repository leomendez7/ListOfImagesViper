//
//  ImageDetailsContract.swift
//  ViperImages
//
//  Created by Leonardo Mendez on 12/04/24.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewImageDetailsProtocol {
    func update(response: Bool)
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterImageDetailsProtocol {
    var view: PresenterToViewImageDetailsProtocol? { get set }
    var interactor: PresenterToInteractorImageDetailsProtocol? { get set }
    var router: PresenterToRouterImageDetailsProtocol? { get set }
    func deleteImage(imageId: String)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorImageDetailsProtocol {
    var presenter: InteractorToPresenterImageDetailsProtocol? { get set }
    func deleteImage(imageId: String, completion: @escaping (Bool, Error?) -> Void)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterImageDetailsProtocol {
    func deleteImage(imageId: String)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterImageDetailsProtocol {
    
}
