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
    @State var sellerData = UserData(user_id: 0, fname: "", lname: "", username: "", bio: "", create_date: "", phone_number: 0, graduation_term: 0, on_campus: 0)
    
    var body: some View {
        
        Form{
            
            Section{
                Text("Item Name:  \(item.name)")
                Text("Item Description:  \(item.description)")
                    .lineLimit(4)
                    .multilineTextAlignment(.leading)
                    .frame(minWidth: 100, maxWidth: 200, minHeight: 100, maxHeight: .infinity, alignment: .topLeading)
                Text("Item Price:  \(item.price)")
                Text("Item Tags:  \(item.keywords)")
            }
            
            Section (header: Text("Seller Information")){
                Text("Seller Name: \(sellerData.username)")
                Text("Phone Number: \(String(sellerData.phone_number))")
                if sellerData.on_campus == 1 {
                    Text("On Campus: Yes")
                }
                else {
                    Text("On Campus: No")
                }
                
            }
            
            Section{
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Contact")
                })
                
            }
        }
        .navigationBarTitle(Text("Item Details")).onAppear {
            CSAPI().sellerIDInfoRequest(user_id: item.seller_id) { (parsedData) in
                self.sellerData = parsedData
            }
        }
    }
    
}



//struct EventInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemListingView()
//    }
//}
