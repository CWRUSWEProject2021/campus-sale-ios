//
//  RootTabbedView.swift
//  WhatsHappenin
//
//  Created by Eric Chang on 11/15/21.
//

import SwiftUI

struct RootTabbedView: View {
    @Binding var isLoggedIn: Bool
//    @Binding var isLoggedIn: Bool
//
//   init(isLoggedIn: Binding<Bool>) {
//        self._isLoggedIn = isLoggedIn
//        let tabBarAppearance = UITabBarAppearance()
//       if #available(iOS 15.0, *) {
//           UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
//       } else {
//           // Fallback on earlier versions
//       }
//    }

    var body: some View {
        TabView {
            FeedTab(searchText: "")
            .tabItem {
                Label("Feed", systemImage: "house")
            }
            UserItemsTab(searchText: "")
            .tabItem {
                Label("Your Items", systemImage: "list.bullet")
            }

            UserProfileTab()
            .tabItem {
                Label("Profile", systemImage: "person")
            }
        }
        .navigationBarBackButtonHidden(isLoggedIn)
        .navigationBarHidden(isLoggedIn)
        Spacer()
    }
}

//struct MainTabbedView_Previews: PreviewProvider {
//    static var previews: some View {
//        RootTabbedView(isLoggedIn: true)
//}
//}
//
