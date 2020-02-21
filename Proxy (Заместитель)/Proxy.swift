
import Foundation

var cacheData: Data? = nil

class Proxy: LoadProtocol {
    var servise: LoadProtocol
    
    init(servise: LoadProtocol) {
        self.servise = servise
    }
    
    func loadImage(url: URL, completionBlock: @escaping (Data?, URLResponse?, Error?) -> Void) {
        if cacheData == nil {
            servise.loadImage(url: url) { (data, response, error) in
                cacheData = data
                completionBlock(data, response, error)
            }
        } else {
            completionBlock(cacheData, nil, nil)
            print(cacheData)
        }
    }
}
