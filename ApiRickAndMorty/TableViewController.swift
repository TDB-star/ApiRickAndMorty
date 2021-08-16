//
//  TableViewController.swift
//  ApiRickAndMorty
//
//  Created by Tatiana Dmitrieva on 07/08/2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    //private var characters: [Character] = []
    private var rickAndMorty: RickAndMorty?
    private var episode: Welcome?
    
    //let loader = CharactersLoader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        loader.delegate = self
//        loader.loadCharacters()
//
//        CharactersLoader.shared.fetchRequest { rickAndMorty in
//            self.rickAndMorty = rickAndMorty
//            self.tableView.reloadData()
//        }
//
        fetchData(from: URLS.rickAndMortyapiCharacter.rawValue)
        CharactersLoader.shared.getEpisode { episode in
            self.episode = episode
            self.tableView.reloadData()
        }
        tableView.rowHeight = 135
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rickAndMorty?.results.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        let character = rickAndMorty?.results[indexPath.row]
        cell.configureCell(with: character!)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let character = rickAndMorty?.results[indexPath.row]
        let episodes = episode?.results[indexPath.row]
        let detailVC = segue.destination as! NewDetailTableViewController
        detailVC.character = character
        detailVC.episode = episodes
    }
    
    @IBAction func updateData(_ sender: UIBarButtonItem) {
        sender.tag == 1 ? fetchData(from: rickAndMorty?.info.next) : fetchData(from: rickAndMorty?.info.prev)
    }
    
    private func fetchData(from url: String?) {
        CharactersLoader.shared.fetchRequest(from: url) { rickAndMorty in
            self.rickAndMorty = rickAndMorty
            self.tableView.reloadData()
        }
    }
}

//extension TableViewController: CharacterLoaderDelegate {
//    func characterLoader(loadCharacters: [Character]) {
//        self.characters = loadCharacters
//        tableView.reloadData()
//    }
//}

// Метод до использования протокола ;)
//extension TableViewController {
//
//    func loadCharacters() {
//        guard let url = URL(string: "https://rickandmortyapi.com/api/character/1,2,3,6,8,10,22,12,13,15") else {return}
//        let request = URLRequest(url: url)
//        URLSession.shared.dataTask(with: request) { data, _, error in
//            guard let data = data else {
//                print(error?.localizedDescription ?? " ")
//                return
//            }
//            do {
//                self.characteres = try JSONDecoder().decode([Character].self, from: data)
//                    DispatchQueue.main.async {
//                        self.tableView.reloadData()
//                }
//                //print(self.characteres)
//            } catch let error {
//                print(error.localizedDescription)
//            }
//        }
//        .resume()
//    }
//}
