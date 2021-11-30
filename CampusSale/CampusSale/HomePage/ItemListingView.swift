//
//  ItemListingView.swift
//  CampusSale
//
//  Created by Eric Chang on 10/17/21.
//


import SwiftUI
import CoreData

struct ItemListingView : View {
    
    @State var item: Product
            
    var body: some View {
        Form{
            Section{
                Text("Item Name:  \(item.name)")
                Text("Item Description:  \(item.description)")
                    .lineLimit(4)
                    .multilineTextAlignment(.leading)
                    .frame(minWidth: 100, maxWidth: 200, minHeight: 100, maxHeight: .infinity, alignment: .topLeading)
                Text("Item Price:  \(item.price)")
                Text("Item Tags:")
            }
            
            Section (header: Text("Seller Information")){
                Text("Seller Name:")
                Text("Phone Number:")
                Text("On Campus: ")
            }
            
            Section{
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Contact")
            })
                
            }
            }
            .navigationBarTitle(Text("Item Details"))
        }
    
}



//struct EventInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemListingView()
//    }
//}
