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
    
    var user: User?
    
//    let baseURL = URL(string: "https://labs11-curie-web.herokuapp.com/api/")!
    let baseURL = URL(string: "http://localhost:5003/api/")!
    
    func answerMoodQuestion(userID: Int, surveyID: Int, feeling: String, completion: @escaping (Int?)->Void){
        
        var requestURL = baseURL
//        guard let userid = user.id else {return}
        requestURL.appendPathComponent("feelings/")
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.post.rawValue
        
        let parameters = ["feeling_text": feeling, "team_member_id": "\(userID)", "survey_id": "\(surveyID)"]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
        } catch let error {
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: request) { (_, response, error) in
            if let error = error {
                NSLog("Error fetching entries \(error)")
                completion(nil)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                //                NSLog("Error fetching entries \(error)")
                completion(nil)
                return
            }
            
            completion(response.statusCode)
            
            }.resume()
        
        
    }
    
    func loadPossibleCurieSurveys(user: User, completion: @escaping ([CurieSurvey]?) -> Void){
        
        var requestURL = baseURL
        guard let userid = user.id else {return}
        requestURL.appendPathComponent("surveys/curie/surveys/team-member/\(userid)")
        
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
                
                let fetchedSurveys = try JSONDecoder().decode(Array<CurieSurvey>.self, from: data)
                
                completion(fetchedSurveys)
                
            } catch {
                NSLog("Error getting data: \(error)")
                completion(nil)
            }
            }.resume()
        
    }
    
    func loadPossibleMoodSurveys(user:User, completion: @escaping ([MoodSurvey]?) -> Void){
        var requestURL = baseURL
        guard let userid = user.id else {return}
        requestURL.appendPathComponent("surveys/surveys/team-member/\(userid)")
        
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
               
                let fetchedSurveys = try JSONDecoder().decode(Array<MoodSurvey>.self, from: data)
                completion(fetchedSurveys)
                
            } catch {
                NSLog("Error getting data: \(error)")
                completion(nil)
            }
            }.resume()
        
        
    }
    
    func loadSingleMoodSurvey(surveyID: Int, completion: @escaping (MoodSurvey?) -> Void){
        var requestURL = baseURL
        requestURL.appendPathComponent("surveys/surveys/survey-id/\(surveyID)")
        
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
                let fetchedSurvey = try JSONDecoder().decode(MoodSurvey.self, from: data)
                completion(fetchedSurvey)
            } catch {
                NSLog("Error getting data: \(error)")
                completion(nil)
            }
            }.resume()
    }
    
    func joinUserTeam(user:User, joinCode:Int, completion: @escaping (Int?) -> Void){
        
        var requestURL = baseURL
        guard let userid = user.id else {return}
        requestURL.appendPathComponent("team_members/\(userid)/join")
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.put.rawValue
        
        let parameters = ["team_code": joinCode]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
        } catch let error {
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: request) { (_, response, error) in
            if let error = error {
                NSLog("Error fetching entries \(error)")
                completion(nil)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                //                NSLog("Error fetching entries \(error)")
                completion(nil)
                return
            }
            
            completion(response.statusCode)
            
            }.resume()
        
        
    }
    
    func createNewUser(user:User, completion: @escaping (Int?) -> Void){
        
        var requestURL = baseURL
        requestURL.appendPathComponent("team_members")
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.post.rawValue
        
        let parameters = ["firstName": "\(user.firstName)", "lastName": "\(user.lastName)", "email": "\(user.email)", "phone": "", "type":nil, "team_id":nil]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters) // pass dictionary to nsdata object and set it as request body
        } catch let error {
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
        URLSession.shared.dataTask(with: request) { (_, response, error) in
            if let error = error {
                NSLog("Error fetching entries \(error)")
                completion(nil)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
//                NSLog("Error fetching entries \(error)")
                completion(nil)
                return
            }
            
            completion(response.statusCode)
            
        }.resume()
        
    }
    
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
    
}
