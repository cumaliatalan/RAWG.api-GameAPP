//
//  GameViewController.swift
//  Appcent
//
//  Created by Cumali Atalan on 19.09.2022.
//

import UIKit



class GameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var firstLinkOfApiPage = "https://api.rawg.io/api/games?key=3f42e2312271420da153ba57f8bc65b3"
    var gameDetailLink = "https://api.rawg.io/api/games/"
    var APIkey = "?key=3f42e2312271420da153ba57f8bc65b3"
    
    private var gameListViewModel : GameListViewModel!
    
    
    @IBOutlet weak var gameTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                

        gameTableView.delegate = self
        gameTableView.dataSource = self
        
        setURL()
    }
        
    func setURL() {
        let url = URL(string: firstLinkOfApiPage)!
        
        WebService().pullData(url: url) { results in
            if let results = results {
                self.gameListViewModel = GameListViewModel(results: results)
                
                DispatchQueue.main.async {
                    self.gameTableView.reloadData()
                }
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        let countSection = self.gameListViewModel == nil ? 0 : self.gameListViewModel.numberOfSections
        return countSection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let countRow = self.gameListViewModel.numberOfRowsInSectionn(section)
        return countRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GameTableViewCell
        
        let gameViewModel = gameListViewModel.gameAtIndex(indexPath.row)
        
        cell.nameLabel.text = gameViewModel.name
        cell.releasedLabel.text = gameViewModel.released
        cell.ratingLabel.text = "\(gameViewModel.rating!)"
        
        let url = URL(string: gameViewModel.background_image!)!
        do {
            let imageData = try Data(contentsOf: url)
            cell.gameImageView.image = UIImage(data: imageData)
        } catch {
            print("error")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetailPage", sender: nil)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailPage" {
            let destinationVC = segue.destination as! GameDetailViewController
            if let indexPath = gameTableView.indexPathForSelectedRow{
                destinationVC.gameID = self.gameListViewModel.gameAtIndex(indexPath.row).id!
            }
        }
    }

}
