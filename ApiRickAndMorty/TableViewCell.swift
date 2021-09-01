//
//  TableViewCell.swift
//  ApiRickAndMorty
//
//  Created by Tatiana Dmitrieva on 07/08/2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var characterImage: CharacterImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterStatusLabel: UILabel!
    @IBOutlet weak var CharacterLocationLabel: UILabel!
    
    func configureCell(with model: Character) {
        characterNameLabel.text = model.name
        characterStatusLabel.text = model.status
        CharacterLocationLabel.text = model.location.name
        characterImage.fetchImage(from: model.image ?? "")
    }
}
