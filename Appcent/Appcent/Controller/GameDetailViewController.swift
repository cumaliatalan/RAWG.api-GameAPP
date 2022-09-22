//
//  GameDetailViewController.swift
//  Appcent
//
//  Created by Cumali Atalan on 19.09.2022.
//

import UIKit

class GameDetailViewController: UIViewController {
    
    var gameID : Int = -1
    var gameDetailLink = "https://api.rawg.io/api/games/"
    var APIkey = "?key=3f42e2312271420da153ba57f8bc65b3"
    
    private var detailListViewModel : DetailListViewModel!
    private var viewModelGameDetail : ViewModelGameDetail!
    
    @IBOutlet weak var gameDetailImageView: UIImageView!
    @IBOutlet weak var gameDetailName: UILabel!
    @IBOutlet weak var gameDetailReleased: UILabel!
    @IBOutlet weak var gameDetailMetacritic: UILabel!
    @IBOutlet weak var gameDetailDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let endPoint = gameDetailLink + String(gameID) + APIkey
        setURL(parametre: endPoint)
        
    }
        
    
    func setURL(parametre : String) {
        
        _ = URL(string: parametre)!
        
        WebServiceGameDetail().pullDetailData(query: parametre) { Result in
            switch Result {
            case .success(let gameResult):
                self.gameDetailName.text = gameResult.name
                self.gameDetailReleased.text = gameResult.released
                self.gameDetailMetacritic.text = String(gameResult.metacritic!)
                self.gameDetailDescription.text = gameResult.description
                
                let imageURL = URL(string: gameResult.background_image ?? "")
                let data = try? Data(contentsOf: imageURL!)
                self.gameDetailImageView.image = UIImage(data: data!)
                
            case .failure(let failResult):
                print(failResult)
            }

        }
        
    }    
}
