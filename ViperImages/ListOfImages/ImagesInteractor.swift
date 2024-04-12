//
//  ImagesInteractor.swift
//  ViperImages
//
//  Created by Leonardo Mendez on 10/04/24.
//  
//

import Foundation
import Alamofire

class ImagesInteractor: PresenterToInteractorImagesProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterImagesProtocol?
    
    func fetchImages(completion: @escaping ([ImageElement], Error?) -> Void) {
        AF.request("https://jsonplaceholder.typicode.com/photos", method: .get).responseDecodable(of: [ImageElement].self) { response in
            switch response.result {
            case .success(let images):
//                print("Imagenes obtenidas con éxito:", images)
                completion(images[0...99].map{ $0 }, nil)
            case .failure(let error):
                print("Error al obtener las imágenes:", error)
                completion([], error)
            }
        }
    }
    
}
