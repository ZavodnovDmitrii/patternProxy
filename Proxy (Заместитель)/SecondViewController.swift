
import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    let url = URL(string: "https://bigpicture.ru/wp-content/uploads/2015/11/nophotoshop29.jpg")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadImage()
    }
    
    
    @IBAction func update(_ sender: Any) {
        cacheData = nil
        image.image = nil
        loadImage()
    }
    
    func loadImage() {
        let load = LoadImage()
        let proxy = Proxy(servise: load)
        
        proxy.loadImage(url: self.url!) { [weak self] (data, response, error) in
            guard let self = self, let data = data, error == nil else { return }
            
            DispatchQueue.main.async {
                self.image.image = UIImage(data: data)
            }
        }
    }
}
