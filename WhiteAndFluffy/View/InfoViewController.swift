import UIKit

class InfoViewController: UIViewController {

    private let networking = Networking()
    
    @IBOutlet weak var nameCityLabel: UILabel! 
    
    @IBOutlet weak var weatherCityLabel: UILabel!
    
    @IBOutlet weak var tempCityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networking.getCities { result in
            switch result {
            case .success(let response): break
            case .failure(let error):
                print(error)
            }
        }
    }

}
