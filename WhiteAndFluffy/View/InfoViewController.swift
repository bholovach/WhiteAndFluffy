import UIKit

class InfoViewController: UIViewController {

    private let networking = Networking()
    var cityName = ""
    var item: List = .init(id: 804, name: "Pushcha-Vodytsya", coord: .init(lat: 30.5, lon: 30.5), main: .init(temp: 275.94, pressure: 1000, humidity: 72), dt: 1637829673, wind: .init(speed: 3.13, deg: 210), sys: .init(country: "UA"), rain: .init(), snow: .init(), clouds: .init(all: 90), weather: [.init(id: 804, main: "Clouds", weatherDescription: "overcast clouds")])

    
    @IBOutlet weak var nameCityLabel: UILabel! {
        didSet {
            nameCityLabel.text = item.name
        }
    }
    
    @IBOutlet weak var weatherCityLabel: UILabel! {
        didSet {
            weatherCityLabel.text = item.weather[0].weatherDescription
        }
    }
    
        @IBOutlet weak var tempCityLabel: UILabel! {
            didSet {
                var celcius = Int(item.main.temp - 273.15)
                tempCityLabel.text = String(celcius)
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
