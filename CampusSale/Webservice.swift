//
//  Webservice.swift
//  CampusSale
//
//  Created by Bradley Wu on 11/14/21.
//

import Foundation

class Webservice {

    func fetchTest(completionHandler: @escaping ([Test]) -> Void) {

        let url = URL(string: "http://jsonplaceholder.typicode.com/posts")!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching films: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                    (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(String(describing: response))")
                return
            }
            
            if let data = data,
                let tests = try? JSONDecoder().decode([Test].self, from: data) {
                completionHandler(tests)
              }
            })
        
            task.resume()
      }
    
    func fetchUserProfile(completionHandler: @escaping ([UserData]) -> Void) {
        
        let url = URL(string: "https://127.0.0.1:5000/user/test_fname1")!

        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching films: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                    (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(String(describing: response))")
                return
            }
            
            if let data = data,
                let dbdata = try? JSONDecoder().decode([UserData].self, from: data) {
                completionHandler(dbdata)
              }
            })
        
            task.resume()
      }
}
