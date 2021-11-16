//
//  UserItemsTab.swift
//  CampusSale
//
//  Created by Eric Chang on 11/15/21.
//

import SwiftUI

struct UserItemsTab: View {
    var body: some View {
        VStack {
            NavigationLink(destination:
                            CreateEventView()){
                Image(systemName: "plus")
                                    .resizable()
                                    .padding(6)
                                    .frame(width: 24, height: 24)
                                    .background(Color.blue)
                                    .clipShape(Circle())
                                    .foregroundColor(.white)
        }
            Text("Your Items")
            Spacer()
        }
    }
}

struct UserItemsTab_Previews: PreviewProvider {
    static var previews: some View {
        UserItemsTab()
    }
}
