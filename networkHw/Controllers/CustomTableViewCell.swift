//
//  TableViewCell.swift
//  networkHw
//
//  Created by BSergio on 16.01.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    // MARK: - IB Outlets
    @IBOutlet weak var nameBeerLabel: UILabel!
    @IBOutlet weak var discriptionBeerLabel: UILabel!
    
    
    // MARK: - Public Methodes
    
    func setCell(beerModel: BeerModel) {
        nameBeerLabel.text = beerModel.name
        discriptionBeerLabel.text = beerModel.description
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
