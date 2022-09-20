//
//  ModelDetailGame.swift
//  Appcent
//
//  Created by Cumali Atalan on 19.09.2022.
//

import Foundation
import UIKit

struct GameDetailList : Decodable {
    let object : [GameDetail]
}

struct GameDetail : Decodable {
    var id : Int?
    var name : String?
    var released : String?
    var metacritic : Double?
    var description : String?
    var background_image : String?
}
