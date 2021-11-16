import UIKit

func loginCall() {
    guard let url = URL(string: "http://127.0.0.1:5000/profile/test_user1") else {
        return
    }
    
    var request = URLRequest(url: url)
    // method, body, headers
    request.httpMethod = "GET"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
}
