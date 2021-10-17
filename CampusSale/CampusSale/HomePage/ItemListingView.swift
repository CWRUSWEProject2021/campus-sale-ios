//
//  ItemListingView.swift
//  CampusSale
//
//  Created by Eric Chang on 10/17/21.
//


import SwiftUI
import CoreData

struct ItemListingView : View {
            
    var body: some View {
        Form{
            Section{
            Text("Item Name:")
            Text("Item Description:")
                .lineLimit(4)
                .multilineTextAlignment(.leading)
                .frame(minWidth: 100, maxWidth: 200, minHeight: 100, maxHeight: .infinity, alignment: .topLeading)
                
            }
            Section{
            Text("Starts:")
            Text("Ends:")
            }
            Text("Address:")
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
            Text("Phone Number:")
            Text("Email:")
            Section{
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Contact")
            })
                
            }
            }
            .navigationBarTitle(Text("Item Details"))
        }
    
}



struct EventInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListingView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
