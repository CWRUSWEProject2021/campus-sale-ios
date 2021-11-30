//
//  UserProfileTab.swift
//  CampusSale
//
//  Created by Eric Chang on 11/15/21.
//

import SwiftUI

struct UserProfileTab: View {
    @State var username: String
    @State var userData = UserData(user_id: 0, fname: "", lname: "", username: "", bio: "", create_date: "", phone_number: 0, graduation_term: 0, on_campus: 0)

    
    var body: some View {
        
        if #available(iOS 15.0, *) {
            VStack {
                VStack {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                    Text("\(userData.fname) \(userData.lname)")
                        .font(.title)
                        .bold()
                }
                
                Spacer().frame(height: 30)
              
                VStack(alignment: .leading, spacing: 12) {
                    Text("\(userData.bio)")
                    HStack {
                        Image(systemName: "person")
                        Text("\(userData.username)")
                    }
                    
                    HStack {
                        Image(systemName: "phone")
                        Text("\(String(userData.phone_number))")
                    }
                    HStack {
                        Image(systemName: "graduationcap")
                        Text("\(String(userData.graduation_term))")
                    }
                }
                
                Spacer().frame(height: 30)
                
                NavigationLink(destination: LoginView(),
                label : {
                    Text("Log Out")
                        .bold()
                        .frame(width: 260, height: 50)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }).navigationBarBackButtonHidden(true)
            }.onAppear() {
                CSAPI().userInfoRequest(username: username) { (parsedData) in
                    self.userData = parsedData
                }
            }
                
        } else {
            // Fallback on earlier versions
        }
}
}


//struct UserProfileTab_Previews: PreviewProvider {
//    static var previews: some View {
//        UserProfileTab()
//    }
//}
