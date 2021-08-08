//
//  TableViewController.swift
//  ApiRickAndMorty
//
//  Created by Tatiana Dmitrieva on 07/08/2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    private var characteres: [Character] = []
    
    let loader = CharactersLoader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loader.delegate = self
        loader.loadCharacters()
            
        tableView.rowHeight = 135
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characteres.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        let character = characteres[indexPath.row]
        cell.configureCell(with: character)
        return cell
    }
}

extension TableViewController: CharacterLoaderDelegate {
    func characterLoader(characteries: [Character]) {
        self.characteres = characteries
        tableView.reloadData()
    }
}

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
