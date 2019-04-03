//
//  UserController.swift
//  Curie
//
//  Created by Farhan on 4/2/19.
//  Copyright © 2019 Farhan Farooqui. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}

class UserController {
    
//    static let shared = UserController()
//    
//    private init() {}
//    
    var user: User?{
        didSet{
            print(user)
        }
    }
    
    let baseURL = URL(string: "https://labs11-curie-web.herokuapp.com/api/")!
    
    func fetchMoreUserData(user:User, completion: @escaping (User?) -> Void){
    
        var requestURL = baseURL
        requestURL.appendPathComponent("team_members/Email/\(user.email)")
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            //Typical Error checking logic
            if let error = error {
                NSLog("Error fetching entries \(error)")
                completion(nil)
                return
            }
            guard let data = data else {
                NSLog("No data returned from data task: \(error!)")
                completion(nil)
                return
            }
            do {
                //Come back to sort
                let fetchedUser = try JSONDecoder().decode(Array<User>.self, from: data)
                completion(fetchedUser.first)
            } catch {
                NSLog("Error getting data: \(error)")
                completion(nil)
            }
        }.resume()
    }
    
//    func createNewUser
}
