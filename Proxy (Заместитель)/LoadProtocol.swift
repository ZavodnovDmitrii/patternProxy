
import Foundation

protocol LoadProtocol {
    func loadImage(url: URL, completionBlock: @escaping(Data?, URLResponse?, Error?) -> Void)
}
