//
//  Default.swift
//  ViperImages
//
//  Created by Leonardo Mendez on 12/04/24.
//

import Foundation

public class Default: ObservableObject {
    
    public enum Key: String {
        case image
    }
    
    public static func destroy(){
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: Key.image.rawValue)
    }
    
    public init() { }

}

extension Default {
    
    public static var image: ImageElement? { return ImageElement.current }
    
    public static func save(image: ImageElement) {
        guard let encoded = try? JSONEncoder().encode(image) else { return }
        UserDefaults.standard.set(encoded, forKey: Default.Key.image.rawValue)
    }
    
}

public extension ImageElement {
    
    static var current: ImageElement? {
        let defaults = UserDefaults.standard
        if let savedImageData = defaults.object(forKey: Default.Key.image.rawValue) as? Data {
            let decoder = JSONDecoder()
            return try? decoder.decode(ImageElement.self, from: savedImageData)
        }
        return nil
    }
    
}
