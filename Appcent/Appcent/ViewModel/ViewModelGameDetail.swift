//
//  ViewModelGameDetail.swift
//  Appcent
//
//  Created by Cumali Atalan on 19.09.2022.
//

import Foundation
import UIKit

struct DetailListViewModel {
    let object : [GameDetail]
}

struct ViewModelGameDetail {
    private let detail : GameDetail
}

extension ViewModelGameDetail {
    init(_ detail : GameDetail){
        self.detail = detail
    }
}

extension ViewModelGameDetail {
    
    var id : Int? {
        return self.detail.id
    }
    
    var name : String? {
        return self.detail.name
    }
    
    var released : String? {
        return self.detail.released
    }
    
    var metacritic : Double? {
        return self.detail.metacritic
    }
    
    var description : String? {
        return self.detail.description
    }
    
    var background_image : String? {
        return self.detail.background_image
    }
}
