//
//  DataSource.swift
//  VTB_HACKATHON_iOS
//
//  Created by Georg on 11.10.2020.
//

import Foundation
import Alamofire
import SwiftyJSON

class DataSource {
    
    public static let shared = DataSource()
    let base = "https://vtb-backend.herokuapp.com/api/"
    let url = URL(string: "https://vtb-backend.herokuapp.com/api/")!
    let carURL = "https://vtb-backend.herokuapp.com/api/car_recognize/"
    let marketplaceSearch = "https://vtb-backend.herokuapp.com/api/marketplace_search/"
    func getCar(carPhotoB64: String, completion: @escaping (_ err: Bool, _ model: String, _ prob: Double) -> ()) {
        AF.request(carURL, method: .post, parameters: CarPhoto(photo: carPhotoB64), encoder: JSONParameterEncoder.default).response { response in
            debugPrint(response)
            if response.error != nil {
                completion(true, "", 0)
            }
            let json = JSON(response.data!)
            print(json)
            print(json["car"])
            completion(false, json["car"][0].string!, json["car"][1].doubleValue)
        }
    }
    
    func searchCar(model: String, completion: @escaping (_ err: Bool, _ make: String, _ make_model: String, _ minPrice: Int, _ maxPrice: Int, _ imageURL: String) -> ()) {
        AF.request(marketplaceSearch, method: .post, parameters: Car(query: model), encoder: JSONParameterEncoder.default).response { response in
            if response.error != nil {
                completion(true, "", "", 0, 0, "")
            }
            debugPrint(response)
            let json = JSON(response.data!)
            debugPrint(json)
            // guard let make = json["make"].string else { return }
            completion(false, json["make"].string!, json["model"].string!, json["minPrice"].int!, json["maxPrice"].int!, json["imageUrl"].string!)
        }
    }
}

/*
func recodnizeCar(carPhotoB64: String) {
    let headers = [
      "x-ibm-client-id": "ИД клиента",
      "content-type": "application/json",
      "accept": "application/json"
    ]
    let parameters = ["content": "iciro"] as [String : Any]

    let postData = CarPhoto(photo: carPhotoB64)

    let request = NSMutableURLRequest(url: NSURL(string: carURL)! as URL,
                                            cachePolicy: .useProtocolCachePolicy,
                                        timeoutInterval: 10.0)
    request.httpMethod = "POST"
    request.allHTTPHeaderFields = headers
    request.httpBody = postData

    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
      if (error != nil) {
        print(error)
      } else {
        let httpResponse = response as? HTTPURLResponse
        print(httpResponse)
      }
    })

    dataTask.resume()
}
 */
