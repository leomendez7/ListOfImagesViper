//
//  ImageListInteractor.swift
//  ViperImages
//
//  Created by Leonardo Mendez on 10/04/24.
//

import Foundation
import Alamofire

class ImageListInteractor {
    
    func fetchImage(completion: @escaping ([ImageElement]?, Error?) -> Void) {
        AF.request("https://jsonplaceholder.typicode.com/photos", method: .get).responseDecodable(of: [ImageElement].self) { response in
            switch response.result {
            case .success(let images):
                print("Imagenes obtenidas con éxito:", images)
                completion(images, nil)
            case .failure(let error):
                print("Error al obtener las imágenes:", error)
                completion(nil, error)
            }
        }
    }
    
    func fetchImage() async throws -> [ImageElement] {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else {
            throw NSError(domain: "URLError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let images = try JSONDecoder().decode([ImageElement].self, from: data)
        return images
    }
    
}
