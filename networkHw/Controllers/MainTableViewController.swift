//
//  MainTableViewController.swift
//  networkHw
//
//  Created by BSergio on 16.01.2022.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    // MARK: - Private Properties
    private let networkManager = NetworkManager()
    
    private let urlString = "https://rustybeer.herokuapp.com/styles"
    
    private var listBeer: [BeerModel] = []
    
    private let indicatorView = UIActivityIndicatorView()
    
    
    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupIndicatorView()
        
        NetworkDataFetcher(networkManager: networkManager).fetchJsonData(urlString: urlString) { listObjects in
            guard let listObjects = listObjects else {
                self.indicatorView.stopAnimating()
                self.showAllert()
                return
            }

            self.listBeer = listObjects
            self.tableView.reloadData()
            
            self.indicatorView.stopAnimating()
        }
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listBeer.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell

        cell.setCell(beerModel: listBeer[indexPath.row])

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Private Methodes
extension MainTableViewController {
    private func setupIndicatorView(){
        indicatorView.center = view.center
        view.addSubview(indicatorView)
        
        indicatorView.startAnimating()
        indicatorView.hidesWhenStopped = true
    }
    
    private func showAllert() {
        let allert = UIAlertController(title: "Server Error", message: "Server error, sorry", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        allert.addAction(action)
        
    }
}
