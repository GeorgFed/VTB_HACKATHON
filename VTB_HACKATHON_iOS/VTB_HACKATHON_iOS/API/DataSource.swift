//
//  DataSource.swift
//  VTB_HACKATHON_iOS
//
//  Created by Georg on 11.10.2020.
//

import Foundation

class DataSource {
    
    public static let shared = DataSource()
    let url = URL(string: "https://vtb-backend.herokuapp.com/api/")!
    
    /*
    func getLinks() {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("error: \(error)")
            } else {
                if let response = response as? HTTPURLResponse {
                    print("statusCode: \(response.statusCode)")
                }
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("data: \(dataString)")
                }
            }
        }
        task.resume()
    }
    
    func carRecognize() {
        var request = URLRequest(url: url + "car_recognize/")
        request.httpMethod = "POST"
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("error: \(error)")
            } else {
                if let response = response as? HTTPURLResponse {
                    print("statusCode: \(response.statusCode)")
                }
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("data: \(dataString)")
                }
            }
        }
        task.resume()
    }
     */
}
