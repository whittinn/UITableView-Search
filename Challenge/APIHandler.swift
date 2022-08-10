//
//  APIHandler.swift
//  Challenge
//
//  Created by Nathaniel Whittington on 6/5/22.
//

import Foundation
import UIKit

class APIHandler {
    
    static let shared = APIHandler()
    private init () {}
    
    func apiCall(url:String, completion: @escaping (Result<Data,Error>)->()){
        
        guard let url = URL(string: url) else {return}
        
        let urlSession = URLSession.shared.dataTask(with: url) { [weak self] data, urlResponse, error in
            guard let _ = self else {return}
            if let data = data {
                completion(.success(data))
        
            }else{
                if let error = error {
                    completion(.failure(error))
                }
            }
        }.resume()
        
    }
    
    
    
    
}
