import Foundation

class Networking {
    func getCities(completion: @escaping (Result<Cities, Error>) -> ()) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/find?lat=50.4547&lon=30.5238&cnt=10&appid=64a19fc4d602039b9dcc9826ea8fc20b") else { return }
        getData(url: url, completion: completion)
    }
    
//    func getWeather(cityName: String, completion: @escaping (Result<Welcome, Error>) -> ()) {
//        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=64a19fc4d602039b9dcc9826ea8fc20b") else { return }
//        getData(url: url, completion: completion)
//    }
    
    func getData<T: Codable>(url: URL, completion: @escaping (Result<T, Error>) -> ()) {
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(.failure(error!))
                }
                return
            }
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decodedData))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
}
