//
//  UserProfileTab.swift
//  CampusSale
//
//  Created by Eric Chang on 11/15/21.
//

import SwiftUI

struct UserProfileTab: View {
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                Text("test_fname1 test_lname1")
                    .font(.title)
                    .bold()
            }
        
        Spacer().frame(height: 30)
        
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "envelope")
                Text("Test_user1")
            }
            
            HStack {
                Image(systemName: "phone")
                Text("1234567890")
            }
        }
        
        Spacer().frame(height: 30)
        
        Button {
            print("Button Tapped")
        }
        label : {
            Text("Log Out")
                .bold()
                .frame(width: 260, height: 50)
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(12)
        }
    }
}
}


struct UserProfileTab_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileTab()
    }
}
