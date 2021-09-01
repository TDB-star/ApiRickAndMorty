//
//  EpisodesTableViewController.swift
//  ApiRickAndMorty
//
//  Created by Tatiana Dmitrieva on 22/08/2021.
//

import UIKit

class EpisodesTableViewController: UITableViewController {

    var character: Character!
    var episodes: [Result] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return character.episode.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let episodeURL = character.episode[indexPath.row]
        CharactersLoader.shared.getEpisodeName(from: episodeURL) { episode in
            self.episodes.append(episode)
            content.text = episode.name
            cell.contentConfiguration = content
        }
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
