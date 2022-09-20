//
//  WebService.swift
//  Appcent
//
//  Created by Cumali Atalan on 18.09.2022.
//

import Foundation
import UIKit

class WebService {
    func pullData(url: URL, completion: @escaping([Game]?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
            
            if let data = data {
                let gameList = try? JSONDecoder().decode(GameList.self, from: data)
                if let gameList = gameList {
                    completion(gameList.results)
                }
            }
        }.resume()
    }
    
    
}
