//
//  NetworkMethods.swift
//  NYTimesApp
//
//  Created by 1 on 11/7/19.
//  Copyright © 2019 Bogdan Magala. All rights reserved.
//

import Alamofire

class NetworkMethods {
    
    let baseUrl = "https://api.nytimes.com/svc/mostpopular/v2/"
    let mostEmailedUrl = "emailed/30.json"
    let mostSharedUrl = "shared/30.json"
    let mostViewedUrl = "viewed/30.json"
    let apiKey = "HUNb0ZJlX59NY7wPM9Xxl1Mnk8oyNR3x"
    
    private func sendBasicRequest(request: String, completion: @escaping (ObtainedData) -> Void) {
        let completeUrl = URL(string: "\(baseUrl)\(request)?api-key=\(apiKey)")
        AF.request(completeUrl!).responseJSON { response in
            
            switch response.response?.statusCode {
            case 200:
                print("SUCCESS")
                let decoder = JSONDecoder()
                guard let data = response.data else { return }
                do {
                    let myResponse = try decoder.decode(ObtainedData.self, from: data)
                    completion(myResponse)
                }
                catch {}
            default:
                print("Error")
                }
        }
    }
    
    func checkConnection() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
    func getMostEmailedArticles(completion: @escaping (ObtainedData) -> Void) {
        sendBasicRequest(request: Requests.mostEmailed, completion: (completion))
    }
    
    func getMostSharedArticles(completion: @escaping (ObtainedData) -> Void) {
        sendBasicRequest(request: Requests.mostShared, completion: (completion))
    }
    
    func getMostViewedArticles(completion: @escaping (ObtainedData) -> Void) {
        sendBasicRequest(request: Requests.mostViewed, completion: (completion))
    }
}
