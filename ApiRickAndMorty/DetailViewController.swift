//
//  DetailViewController.swift
//  ApiRickAndMorty
//
//  Created by Tatiana Dmitrieva on 11/08/2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    var character: Character!
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        if let topItem = navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        title = character.name
        descriptionLabel.text = character.description
        
        DispatchQueue.global().async {
            guard let imageData = ImageManager.shared.fetchImage(from: self.character.image) else { return }
            DispatchQueue.main.async {
                self.characterImage.image = UIImage(data: imageData)
            }
        }
       
    }
}
