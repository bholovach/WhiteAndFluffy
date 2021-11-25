import UIKit

class CitiesViewController: UIViewController {

    private var cities: [List] = []
    private let networking = Networking()
   
    
    @IBAction func addDidTapButton(_ sender: Any) {
        let alert = UIAlertController(title: "Погода", message: "У природы нет плохой погоды", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default))
        self.present(alert, animated: true, completion: nil)
    }
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UINib(nibName: "CitiesViewCell", bundle: nil), forCellReuseIdentifier: "CitiesViewCell")
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        
        networking.getCities { result in
            switch result {
            case .success(let response):
                self.cities = response.list
                print(response)
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
   
}

extension CitiesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CitiesViewCell", for: indexPath) as! CitiesViewCell
        cell.configure(item: cities[indexPath.row])
        return cell
    }
}

extension CitiesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "InfoViewController") as! InfoViewController
        viewController.item = cities[indexPath.row]
        self.navigationController?.pushViewController(viewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


