
import Foundation

class LoadImage: LoadProtocol {
    
    func loadImage(url: URL, completionBlock: @escaping (Data?, URLResponse?, Error?) -> Void) {
        
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil
        
        let session = URLSession.init(configuration: config)
        session.dataTask(with: url, completionHandler: completionBlock).resume()
    }
}
