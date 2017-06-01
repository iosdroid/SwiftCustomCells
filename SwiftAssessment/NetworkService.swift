//
//  NetworkService.swift
//  SwiftAssessment
//
//  Created by Muthupalaniappan S on 06/04/17.
//  Copyright © 2017 sensiple. All rights reserved.
//

import Foundation
class NetworkService
{
    lazy var configuration: URLSessionConfiguration = URLSessionConfiguration.default
    lazy var session: URLSession = URLSession(configuration: self.configuration)
    
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    typealias jsonDataHandler = ((Data) -> Void)
    
    func getJsonData(_ completion: @escaping jsonDataHandler)
    {
        let request = URLRequest(url: self.url)
        let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) in
            
            if error == nil {
                if let httpResponse = response as? HTTPURLResponse {
                    switch (httpResponse.statusCode) {
                    case 200:
                        if let data = data {
                            completion(data)
                        }
                    default:
                        print(httpResponse.statusCode)
                    }
                }
            } else {
                print("Error: \(error?.localizedDescription)")
            }
        })
        
        dataTask.resume()
    }
}

extension NetworkService
{
    static func parseJSONFromData(_ jsonurl: URL?) -> [String : AnyObject]?
    {
        if let jsurl = jsonurl {
            do {
                let jsonData = try Data(contentsOf: jsurl)
                let jsonDictionary = try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as? [String : AnyObject]
                return jsonDictionary
            } catch let error as NSError {
                print("Error processing json data: \(error.localizedDescription)")
            }
        }
        
        return nil
    }
}
//func getJSON(urlToRequest: URL?) -> Data{
//    if let jsurl = urlToRequest {
//        do {
//            return try Data(contentsOf: jsurl)
//        } catch let error as NSError {
//            print("Error processing json data: \(error.localizedDescription)")
//        }
//    }
//    
////    return
//    
//}
//
////func parseJSON(inputData: Data?) -> [String : AnyObject]?{
////    if let jsonData = inputData {
////        do {
////    let jsonDictionary = try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as? [String : AnyObject]
////
////            return jsonDictionary
////            } catch let error as NSError {
////                print("Error processing json data: \(error.localizedDescription)")
////        }
////    }
////
////    return nil
////}
