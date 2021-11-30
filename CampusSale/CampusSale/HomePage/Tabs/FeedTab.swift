//
//  FeedTab.swift
//  CampusSale
//
//  Created by Eric Chang on 11/15/21.
//

import SwiftUI

struct FeedTab: View {
    @State var searchText: String
    @State var items: [Product] = []
    var body: some View {
        VStack() {
            SearchBar(text1: $searchText)
            if #available(iOS 15.0, *) {
                List((items.filter({ searchText.isEmpty ? true : $0.keywords.contains(searchText) || $0.name.contains(searchText)}))) { item in
                    NavigationLink(item.name, destination: ItemListingView(item: item))}
                .refreshable {
                    CSAPI().requestAllItems { (parsedData) in
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
}

//struct FeedTab_Previews: PreviewProvider {
//    static var previews: some View {
//        FeedTab(searchText: "", places: Place.samples())
//    }
//}
}
