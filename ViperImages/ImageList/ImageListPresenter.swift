//
//  ImageListPresenter.swift
//  ViperImages
//
//  Created by Leonardo Mendez on 10/04/24.
//

import Foundation

protocol ImageListUI: AnyObject {
    func update(images: [ImageElement])
}

class ImageListPresenter {

    private let imageListInteractor: ImageListInteractor
    var imageListUI: ImageListUI?
    
    init(imageListInteractor: ImageListInteractor) {
        self.imageListInteractor = imageListInteractor
    }
    
    public func onViewAppear() async {
        do {
            let images = try await imageListInteractor.fetchImage()
            imageListUI?.update(images: images)
        } catch {
            print("Error al obtener las imágenes:", error)
        }
    }
    
    public func onViewAppear2() {
        imageListInteractor.fetchImage { response, error in
            DispatchQueue.main.async {
                guard let images = response else { return }
                self.imageListUI?.update(images: images)
            }
        }
    }
    
}
