import Foundation

struct Cities: Codable {
    let message, cod: String
    let count: Int
    let list: [List]
}

struct List: Codable {
    let id: Int
    let name: String
    let coord: CityCoord
    let main: CityMain
    let dt: Int
    let wind: CityWind
    let sys: CitySys
    let rain, snow: JSONNull
    let clouds: CityClouds
    let weather: [CityWeather]
    
}

struct CityClouds: Codable {
    let all: Int
}

struct CityCoord: Codable {
    let lat, lon: Double
}

struct CityMain: Codable {
    let temp: Double
    let pressure, humidity: Int
    enum CodingKeys: String, CodingKey {
            case temp
            
            case pressure, humidity
        }
}

struct CitySys: Codable {
    let country: String
}

struct CityWeather: Codable {
    let id: Int
    let main, weatherDescription: String
    enum CodingKeys: String, CodingKey {
            case id, main
            case weatherDescription = "description"
        
        }
}

struct CityWind: Codable {
    let speed: Double
    let deg: Int
}

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
