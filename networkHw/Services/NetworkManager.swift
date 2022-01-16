//
//  NetworkManager.swift
//  networkHw
//
//  Created by BSergio on 16.01.2022.
//

import Foundation

struct NetworkManager {
    
    func request(urlString: String, completionHandler: @escaping (Data?, Error?) ->Void){
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        let task = createDataTask(from: request, completionHandler: completionHandler)
        task.resume()
                
    }
    
    private func createDataTask(from request: URLRequest, completionHandler: @escaping (Data?, Error?) ->Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request, completionHandler: { (data, _, error) in
            DispatchQueue.main.async {
                completionHandler(data, error)
            }
        })
    }
    
    
}
