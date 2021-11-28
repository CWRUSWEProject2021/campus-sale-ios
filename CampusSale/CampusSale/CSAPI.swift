//
//  CSAPI.swift
//  CampusSale
//
//  Created by Eric Chang on 11/15/21.
//
import Foundation
class CSAPI {
    
    func loginRequest(username: String, password: String, completion: @escaping (loginInfo) -> ()) {
        guard let url = URL(string: "http://127.0.0.1:5000/profile/\(username)") else {
            print("Error: cannot create URL")
            return
        }
        // Create the url request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Error: error calling GET")
                print(error!)
                return
            }
            guard let data = data else {
                print("Error: Did not receive data")
                return
            }
            guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                print("Error: HTTP request failed")
                return
            }
            do {
                guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    print("Error: Cannot convert data to JSON object")
                    return
                }
                guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                    print("Error: Cannot convert JSON object to Pretty JSON data")
                    return
                }
                guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                    print("Error: Could print JSON in String")
                    return
                }
                let decoder = JSONDecoder()
                let parsedData = try! decoder.decode(UserProfileData.self, from: data)
                DispatchQueue.main.async {
                    let info = loginInfo(username: username, password: parsedData.password)
                    completion(info)
                }
            }
            catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
        }.resume()
    }
    
    
//    func registerRequest(username: String, password: String, completion: @escaping (Bool) -> ()) {
//        guard let url = URL(string: "http://127.0.0.1:5000/profile/\(username)") else {
//            print("Error: cannot create URL")
//            return
//        }
//        
//        guard let jsonData = try? JSONEncoder().encode(LoginInfo) else {
//            print("Error: Trying to convert model to JSON data")
//            return
//        }
//        
//        // Create the url request
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type") // the request is JSON
//        request.setValue("application/json", forHTTPHeaderField: "Accept") // the response expected to be in JSON format
//        request.httpBody = jsonData
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            guard error == nil else {
//                print("Error: error calling POST")
//                print(error!)
//                return
//            }
//            guard let data = data else {
//                print("Error: Did not receive data")
//                return
//            }
//            guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
//                print("Error: HTTP request failed")
//                return
//            }
//            do {
//                guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
//                    print("Error: Cannot convert data to JSON object")
//                    return
//                }
//                guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
//                    print("Error: Cannot convert JSON object to Pretty JSON data")
//                    return
//                }
//                guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
//                    print("Error: Could print JSON in String")
//                    return
//                }
//                let decoder = JSONDecoder()
//                let parsedData = try! decoder.decode(UserProfileData.self, from: data)
//                print(prettyPrintedJson)
//                print(parsedData.password)
//                DispatchQueue.main.async {
//                    var flag = false
//                    if (password == parsedData.password){
//                        flag = true
//                    }
//                    completion(flag)
//                }
//            }
//            catch {
//                print("Error: Trying to convert JSON data to string")
//                return
//            }
//        }.resume()
//    }
    
    func requestAllItems(completion: @escaping ([Product]) -> ()) {
        guard let url = URL(string: "http://127.0.0.1:5000/product") else {
            print("Error: cannot create URL")
            return
        }
        // Create the url request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Error: error calling GET")
                print(error!)
                return
            }
            guard let data = data else {
                print("Error: Did not receive data")
                return
            }
            guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                print("Error: HTTP request failed")
                return
            }
            do {
                let decoder = JSONDecoder()
                let parsedData = try! decoder.decode([Product].self, from: data)
                print(parsedData)
                DispatchQueue.main.async {
                    completion(parsedData)
                }
            }
            catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
        }.resume()
    }
}
