//
//  ImageDetailsInteractor.swift
//  ViperImages
//
//  Created by Leonardo Mendez on 12/04/24.
//  
//

import Foundation
import Alamofire

class ImageDetailsInteractor: PresenterToInteractorImageDetailsProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterImageDetailsProtocol?
    
    func deleteImage(imageId: String, completion: @escaping (Bool, Error?) -> Void) {
        AF.request("https://jsonplaceholder.typicode.com/photos/\(imageId)", method: .delete).response(completionHandler: { response in
            switch response.result {
            case .success:
                print("Delete image")
                completion(true, nil)
            case .failure(let error):
                print("Error al obtener las imágenes:", error)
                completion(false, error)
            }
        })
    }
    
}
