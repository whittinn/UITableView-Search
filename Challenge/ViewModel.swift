//
//  ViewModel.swift
//  Challenge
//
//  Created by Nathaniel Whittington on 6/5/22.
//

import Foundation

class ViewModel {
    var userObject: User?
    
    func getData(completion: @escaping (User?)->()){
        APIHandler.shared.apiCall(url: "https://jsonplaceholder.typicode.com/todos/1") {[weak self] data in
            guard let strongSelf = self else {return}
            switch(data){
                
            case .success(let userInfo):
                
                do{
                    let user = try JSONDecoder().decode(User.self, from: userInfo)
                    strongSelf.userObject = user
                    completion(user)
                    print(user.title ?? "")
                }catch{
                    print(error)
                }
            
            case .failure(let error):
                print("Error loading data: \(error)")
            }
            
        }
        
        
    }
}
