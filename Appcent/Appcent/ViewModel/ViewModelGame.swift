//
//  ViewModelGame.swift
//  Appcent
//
//  Created by Cumali Atalan on 18.09.2022.
//

import Foundation
import UIKit

struct GameListViewModel {
    let results : [Game]
}



extension GameListViewModel {
    var numberOfSections : Int {
        return results.count
    }
    
    func numberOfRowsInSectionn(_ section : Int) -> Int {
        return results.count
    }
    
    func gameAtIndex(_ index : Int) -> ViewModelGame {
        let game = self.results[index]
        return ViewModelGame(game)
    }
}

struct ViewModelGame {
    private let game : Game
}

extension ViewModelGame {
    init(_ game : Game) {
        self.game = game
    }
}

extension ViewModelGame {
    
    var id : Int? {
        return self.game.id
    }
    
    var name : String? {
        return self.game.name
    }
    
    var rating : Double? {
        return self.game.rating
    }
    
    var released : String? {
        return self.game.released
    }
    
    var background_image : String? {
        return self.game.background_image
    }

}
