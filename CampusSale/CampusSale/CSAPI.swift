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
    
    
    func registerUserRequest(username: String, password: String, fname: String, lname: String, bio: String, phone_number: Int, graduation_term: Int, on_campus: Int, completion: @escaping (Bool) -> ()) {
        guard let url = URL(string: "http://127.0.0.1:5000/user/\(username)") else {
            print("Error: cannot create URL")
            return
        }
        let LoginInfo = CreateAccount(fname: fname, lname: lname, username: username, password: password, bio: bio, phone_number: phone_number, graduation_term: graduation_term, on_campus: on_campus)
        
        
        guard let jsonData = try? JSONEncoder().encode(LoginInfo) else {
            print("Error: Trying to convert model to JSON data")
            return
        }
        
        // Create the url request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type") // the request is JSON
        request.setValue("application/json", forHTTPHeaderField: "Accept") // the response expected to be in JSON format
        request.httpBody = jsonData
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Error: error calling POST")
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
                    
                }
            }
            catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
        }.resume()
    }
    
    func registerProfileRequest(username: String, password: String, completion: @escaping(Bool) -> ()) {
        // ***** POST call #2 for profile db ***** //
        guard let url = URL(string: "http://127.0.0.1:5000/profile/\(username)") else {
            print("Error: cannot create URL")
            return
        }
        let LoginInfo = loginInfo(username: username, password: password)
        
        
        guard let jsonData = try? JSONEncoder().encode(LoginInfo) else {
            print("Error: Trying to convert model to JSON data")
            return
        }
        
        // Create the url request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type") // the request is JSON
        request.setValue("application/json", forHTTPHeaderField: "Accept") // the response expected to be in JSON format
        request.httpBody = jsonData
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Error: error calling POST")
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
//                print(prettyPrintedJson)
                
                DispatchQueue.main.async {
                    
                }
            }
            catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
        }.resume()
    }
    
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
    
    func userInfoRequest(username: String, completion: @escaping (UserData) -> ()) {
        guard let url = URL(string: "http://127.0.0.1:5000/user/\(username)") else {
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
                let parsedData = try! decoder.decode(UserData.self, from: data)
                DispatchQueue.main.async {
                    let userData = UserData(user_id: parsedData.user_id, fname: parsedData.fname, lname: parsedData.lname, username: parsedData.username, bio: parsedData.bio, create_date: parsedData.create_date, phone_number: parsedData.phone_number, graduation_term: parsedData.graduation_term, on_campus: parsedData.on_campus)
                    completion(userData)
                }
            }
            catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
        }.resume()
    }
    
    func userProductRequest(username: String, completion: @escaping ([Product]) -> ()) {
        guard let url = URL(string: "http://127.0.0.1:5000/product/\(username)") else {
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
    
    
    func sellerIDInfoRequest(user_id: Int, completion: @escaping (UserData) -> ()) {
        guard let url = URL(string: "http://127.0.0.1:5000/userid/\(user_id)") else {
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
                let parsedData = try! decoder.decode(UserData.self, from: data)
                DispatchQueue.main.async {
                    let userData = UserData(user_id: parsedData.user_id, fname: parsedData.fname, lname: parsedData.lname, username: parsedData.username, bio: parsedData.bio, create_date: parsedData.create_date, phone_number: parsedData.phone_number, graduation_term: parsedData.graduation_term, on_campus: parsedData.on_campus)
                    completion(userData)
                }
            }
            catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
        }.resume()
    }
    
    func CreateItemListing(username: String, listingName: String, price: Float, description: String, keywords: String, completion: @escaping(Bool) -> ()) {
        // ***** POST call #2 for profile db ***** //
        guard let url = URL(string: "http://127.0.0.1:5000/seller/\(username)/product/\(listingName)") else {
            print("Error: cannot create URL")
            return
        }
        let productDetails = CreateProduct(name: listingName, price: price, description: description, keywords: keywords)
        
        
        guard let jsonData = try? JSONEncoder().encode(productDetails) else {
            print("Error: Trying to convert model to JSON data")
            return
        }
        
        // Create the url request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type") // the request is JSON
        request.setValue("application/json", forHTTPHeaderField: "Accept") // the response expected to be in JSON format
        request.httpBody = jsonData
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Error: error calling POST")
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
                //let decoder = JSONDecoder()
                //let parsedData = try! decoder.decode(UserProfileData.self, from: data)
//                print(prettyPrintedJson)
                
                DispatchQueue.main.async {
                    
                }
            }
            catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
        }.resume()
    }
    
    
}

