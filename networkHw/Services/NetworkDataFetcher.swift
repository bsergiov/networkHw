//
//  NetworkDataFetcher.swift
//  networkHw
//
//  Created by BSergio on 16.01.2022.
//

import Foundation

struct NetworkDataFetcher {
    
    let networkManager: NetworkManager
    
    
    func fetchJsonData(urlString: String, completion: @escaping (_ beerModel: [BeerModel]?) -> Void){
        networkManager.request(urlString: urlString) { data, error in
            if let error = error {
                print("Fetch error \(error)")
                completion(nil)
            }
            
            let response = decodeJson(data: data)
            completion(response)
        }
    }
    
    
    private func decodeJson(data: Data?) -> [BeerModel]? {
        let decoder = JSONDecoder()
        guard let data = data else { return nil }
        do {
            let objects = try decoder.decode([BeerModel].self, from: data)
            return objects
        }catch let error {
            print("error decod \(error.localizedDescription)")
            return nil
        }
    }
}
