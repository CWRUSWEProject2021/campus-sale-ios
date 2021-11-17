//
//  LoginView.swift
//  CampusSale
//
//  Created by Eric Chang on 10/13/21.
//

import SwiftUI
import CoreData


let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

let logininfo = UserLoginInfo(username: "", password: "")

struct LoginView : View {
    @State var username: String = ""
    @State var password: String = ""
    @State var isLoggedIn: Bool = false
    @State var attemptinglogin: Bool = false
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Campus Sale")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.bottom, 20)
                
                Image("ImageNameHere")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipped()
                    .cornerRadius(150)
                    .padding(.bottom, 20)
                
                Text("Each College's Online Marketplace!")
                    .font(.title2)
                    .fontWeight(.thin)
                    .padding(.bottom, 20)
                
                TextField("Username", text: $username)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 5)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 10)
                
                let infos: loginInfo = loginInfo(username: username, password: password)
                NavigationLink(destination: RootTabbedView(), isActive: $isLoggedIn) {
                    Button(action: {
                        attemptinglogin = true
                        CSAPI().loginRequest(username: username, password: password) { (info) in
                            
                            if (info.username == username && info.password == password){
                                print("Login Successful")
                                isLoggedIn = true
                            }
                            else{
                                attemptinglogin = false
                                print("Login Failed")
                                //error message popup
                            }
                        }
                    }) {
                        Text("LOGIN")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 220, height: 60)
                            .background(Color.orange)
                            .cornerRadius(15.0)
                        //                    LoginButton(username:username, password: password)
                    }
                    //                if(isLoggedIn){
                    //                    NavigationLink("Home", destination: RootTabbedView())
                    //                }
                    
                }
                NavigationLink(destination:RegistrationView()) {
                    Text("REGISTER")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60)
                        .background(Color.blue)
                        .cornerRadius(15.0)
                }
                //                WaitingIndicator()
                //                                .opacity(attemptinglogin ? 1.0 : 0.0)
            }
            .padding()
            .navigationBarHidden(true)
            
            
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}



struct WelcomeMessage: View {
    var body: some View {
        Text("Campus Sale")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

struct UsernameField: View {
    @State var username: String = ""
    var body: some View {
        TextField("Username", text: $username)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 5)
    }
}

struct PasswordField: View {
    @State var password: String = ""
    var body: some View {
        SecureField("Password", text: $password)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 10)
    }
}

//struct LoginButton: View {
//    var body: some View {
//        NavigationLink(destination:
//                        RootTabbedView()){
//        Text("LOGIN")
//            .font(.headline)
//            .foregroundColor(.white)
//            .padding()
//            .frame(width: 220, height: 60)
//            .background(Color.orange)
//            .cornerRadius(15.0)
//    }
//}
//}


//struct Login: View {
//    var body: some View {
//        Button(action: {print("Button tapped")}) {
//            LoginButton()
//        }
//    }
//}
//

struct AppIcon: View {
    var body: some View {
        Image("ImageNameHere")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 20)
    }
}



struct TaglineMessage: View {
    var body: some View {
        Text("Each College's Online Marketplace!")
            .font(.title2)
            .fontWeight(.thin)
            .padding(.bottom, 20)
    }
}

struct Register: View {
    var body: some View {
        NavigationLink(destination:RegistrationView()) {
            Text("REGISTER")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 220, height: 60)
                .background(Color.blue)
                .cornerRadius(15.0)
        }
    }
}




