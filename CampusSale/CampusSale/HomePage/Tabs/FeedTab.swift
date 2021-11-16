//
//  FeedTab.swift
//  CampusSale
//
//  Created by Eric Chang on 11/15/21.
//

import SwiftUI

struct FeedTab: View {
    @State var searchText: String
    let places: [Place]
    var body: some View {
        VStack(spacing: 0) {
            List(places.filter({ searchText.isEmpty ? true : $0.eventName.contains(searchText) })) { item in NavigationLink(item.eventName, destination: ItemListingView())}
            Spacer()
        }
    }
}

struct FeedTab_Previews: PreviewProvider {
    static var previews: some View {
        FeedTab(searchText: "", places: Place.samples())
    }
}
