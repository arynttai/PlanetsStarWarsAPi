import Foundation
import Alamofire

class AlamofireNetworkManager {
    
    static let shared = AlamofireNetworkManager()

    func getstarships(completion: @escaping (SWPlanetsResponse?) -> Void) {
        let url = URL(string: "https://swapi.py4e.com/api/planets/")!

        AF.request(url).response { response in

            print(response.response?.statusCode)

            if let data = response.data {
                let decoder = JSONDecoder()
                do {
                    let planets = try decoder.decode(SWPlanetsResponse.self, from: data)
                    completion(planets)
                }catch {
                    completion(nil)
                }
            }
        }
    }
}
struct SWPlanetsResponse: Codable {
    var results: [Planets]
}
struct Planets: Codable{
    var name: String
    var diameter: String
    var climate: String
    var population: String
}

