//
//  NewDetailTableViewController.swift
//  ApiRickAndMorty
//
//  Created by Tatiana Dmitrieva on 14/08/2021.
//

import UIKit

class NewDetailTableViewController: UITableViewController {
    
    var character: Character!
    var episode: Result!
    
    @IBOutlet weak var characterImageView: CharacterImageView!
    
    @IBOutlet weak var liveStatusLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var speicesAndGenderLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var episodesLabel: UILabel!
    @IBOutlet weak var episodeNumber: UILabel!
    @IBOutlet weak var firstSeenEpisodeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        
        if let topItem = navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        title = character.name
        setCharactersDetails(with: character)
    }
   
    private func setCharactersDetails(with model: Character) {

        characterImageView.fetchImage(from: model.image ?? "")
        liveStatusLabel.text = character.status
        nameLabel.text = character.name
        speicesAndGenderLabel.text = character.speicesAndGender
        locationLabel.text = character.location.name
        episodesLabel.text = episode.name
        firstSeenEpisodeLabel.text = episode.name
        episodeNumber.text = episode.episode
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let episodesVC = navigationController.topViewController as! EpisodesTableViewController
        episodesVC.character = character
    }
    
    @IBAction func episodesButtonTapped(_ sender: Any) {
    }
}
