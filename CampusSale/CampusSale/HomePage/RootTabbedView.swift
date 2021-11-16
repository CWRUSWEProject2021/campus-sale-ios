//
//  RootTabbedView.swift
//  WhatsHappenin
//
//  Created by Eric Chang on 11/15/21.
//

import SwiftUI

struct RootTabbedView: View {
//    @Binding var isLoggedIn: Bool
//
//    init(isLoggedIn: Binding<Bool>) {
//        self._isLoggedIn = isLoggedIn
//        let tabBarAppearance = UITabBarAppearance()
//        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
//    }

    var body: some View {
        TabView {
            NavigationView {
                FeedTab(searchText: "", places: Place.samples())
            }
            .navigationTitle("Feed")
            .tabItem {
                Label("Feed", systemImage: "house")
            }
            
            NavigationView {
                UserItemsTab()
            }
            .navigationTitle("Your Items")
            .tabItem {
                Label("Your Items", systemImage: "list.bullet")
            }

            NavigationView {
                UserProfileTab()
            }
            .navigationTitle("Profile")
            .tabItem {
                Label("Profile", systemImage: "person")
            }
        }
        Spacer()
    }
}

struct MainTabbedView_Previews: PreviewProvider {
    static var previews: some View {
        RootTabbedView()
}
}

