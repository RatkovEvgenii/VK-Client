//
//  ImageCache .swift
//  VK Client
//
//  Created by  Евгений Ратков on 27.11.21.
//

import Foundation

class ImageCache {
    
    static var shared: ImageCache = ImageCache()
    
    private var network: RequestToAPI = RequestToAPI()
    
    private init() {}
    
    private let cache = NSCache<NSString, NSData>()
    
    func get( urlString:String, handler: @escaping (NSData) -> ()) {
        if let data = cache.object(forKey: urlString as NSString) {
            handler(data)
        } else {
            network.getImage(by: urlString) { [weak self] (data) in
                if let nsdata = data as NSData? {
                    self?.cache.setObject(nsdata, forKey: urlString as NSString)
                }
            }
        }
    }
}
