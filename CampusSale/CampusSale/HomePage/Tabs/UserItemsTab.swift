//
//  UserItemsTab.swift
//  CampusSale
//
//  Created by Eric Chang on 11/15/21.
//

import SwiftUI

struct UserItemsTab: View {
    @State var searchText: String
    @State var items: [Product] = []
    @State var username: String
    
    var body: some View {
        VStack {
            VStack() {
                SearchBar(text1: $searchText)
                if #available(iOS 15.0, *) {
                    List((items.filter({ searchText.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(searchText) }))) { item in
                        NavigationLink(item.name, destination: ItemListingView(item: item))}
                    .refreshable {
                        CSAPI().userProductRequest(username: username) { (parsedData) in
                            self.items = parsedData
                        }
    //                    .onAppear {
    //                        CSAPI().requestAllItems { (parsedData) in
    //                            self.items = parsedData
    //                        }
    //                    }
                                   // List(items.filter({ searchText.isEmpty ? true : $0.name.contains(searchText) })) { item in NavigationLink(item.name, destination: ItemListingView(item: items[item]))}
                    }
                    .background()
                    Spacer()
                } else {
                    // Fallback on earlier versions
                }
        }
            NavigationLink(destination:
                            CreateItemView(username: username)){
                Image(systemName: "plus")
                                    .resizable()
                                    .padding(6)
                                    .frame(width: 24, height: 24)
                                    .background(Color.blue)
                                    .clipShape(Circle())
                                    .foregroundColor(.white)
        }
            Text("Add Item")
            Spacer()
        }
    }
}

//struct UserItemsTab_Previews: PreviewProvider {
//    static var previews: some View {
//        UserItemsTab()
//    }
//}
