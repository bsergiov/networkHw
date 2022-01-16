//
//  ViewController.swift
//  networkHw
//
//  Created by BSergio on 15.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    // MARK: - Private Properties
    private let networkManager = NetworkManager()
    private let urlString = "https://rustybeer.herokuapp.com/styles"
    
    private var listBeer: [BeerModel] = []
    
    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkDataFetcher(networkManager: networkManager).fetchJsonData(urlString: urlString) { beerModels in
            if let beerModels = beerModels {
                self.listBeer = beerModels
                
            }
            
        }
    }
    
    
}

