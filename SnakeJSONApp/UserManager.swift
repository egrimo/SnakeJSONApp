//
//  UserManager.swift
//  SnakeJSONApp
//
//  Created by Ege Sucu on 19.01.2022.
//

import Foundation

class UserManager: ObservableObject{
    @Published var users = [User]()
    
    func fetchUsers(){
        if let path = Bundle.main.url(forResource: "UserData", withExtension: "json"){
            do {
                let data = try Data(contentsOf: path, options: .mappedIfSafe)
                let userList = try SnakeDecoder().decode(Users.self, from: data)
                self.users = userList.users
            } catch let error {
                print(String(describing: error))
            }
        }
    }
    
    func fetchUserDetail(with name: String, completion: @escaping (Result<User?,UserError>) -> Void){
        if !users.isEmpty{
            let user = users.filter({ $0.userName == name })
            if user.isEmpty{
                completion(.failure(.notFound))
            } else {
                completion(.success(user.first))
            }
        }
    }
}
