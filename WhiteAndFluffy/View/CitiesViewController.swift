import UIKit

class CitiesViewController: UIViewController {

    private var cities: [List] = []
    private let networking = Networking()
    
    
    
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
        let viewcontroller = storyboard.instantiateViewController(withIdentifier: "InfoViewController") as! InfoViewController
//        viewcontroller.noteText = filteredNotes[indexPath.row].description
//        viewcontroller.actionType = .edit
//        viewcontroller.delegate = self
//        viewcontroller.index = indexPath.row
        self.navigationController?.pushViewController(viewcontroller, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


