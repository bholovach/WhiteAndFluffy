import UIKit

class CitiesViewCell: UITableViewCell {

    @IBOutlet weak var nameCityLabel: UILabel!
    
    @IBOutlet weak var weatherLabel: UILabel!
    
    @IBOutlet weak var tempLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(item: List) {
        nameCityLabel.text = item.name
        weatherLabel.text = item.weather[0].weatherDescription
        tempLabel.text = String(Int(item.main.temp - 273.15))
    }
}
